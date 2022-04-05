import 'dart:convert';
import 'package:concentric_transition/page_view.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jfamosdelivery/helper/consts.dart';
import 'authscreen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int position = 1;
  var pageController = PageController();

  Future getData() async {
    var onBoardingAPI =
        'http://www.jfamoslogistics.com/APIs/APIs2.asmx/OnBoarding?position=$position';
    var data = await http.get(
      Uri.parse(onBoardingAPI),
    );
    if (data.statusCode == 200) {
      return data.body;
    } else {
      throw Exception('Failed to load data, statusCode: ${data.statusCode}');
    }
  }

  Future getTitle() async {
    var data = await getData();
    String title = jsonDecode(data)[0]['otitle'];
    return title;
  }

  Future getDescription() async {
    var data = await getData();
    String description = jsonDecode(data)[0]['odescription'];
    return description;
  }

  Future getImage() async {
    var data = await getData();
    String image = jsonDecode(data)[0]['oimage'];
    return image;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        onFinish: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AuthScreen(),
            ),
          );
        },
        onChange: (page) {
          setState(() {
            position++;
          });
        },
        colors: const [Colors.white, kGreenColor, Colors.white],
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (int index, double value) {
          return Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.72,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    StreamBuilder(
                      builder: (context, snapshot) {
                        if (snapshot.data != null) {
                          return Image.network(
                              'http://jfamoslogistics.com/images/${snapshot.data}');
                        } else {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                      },
                      stream: getImage().asStream(),
                    ),
                    StreamBuilder(
                      builder: (context, snapshot) {
                        return snapshot.data != null
                            ? Text(
                                snapshot.data.toString(),
                                style: TextStyle(
                                    fontSize: 60,
                                    fontWeight: FontWeight.bold,
                                    color: position == 2
                                        ? const Color.fromARGB(
                                            255, 247, 247, 207)
                                        : kGreenColor,
                                    fontFamily: 'fredoka'),
                              )
                            : const Center(child: CircularProgressIndicator());
                      },
                      stream: getTitle().asStream(),
                    ),
                    FutureBuilder(
                      builder: (context, snapshot) {
                        return snapshot.data != null
                            ? Text(
                                snapshot.data.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400,
                                    color: position == 2
                                        ? Color.fromARGB(220, 255, 255, 255)
                                        : Colors.black,
                                    fontFamily: 'fredoka'),
                              )
                            : const Center(child: CircularProgressIndicator());
                      },
                      future: getDescription(),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
        pageController: pageController,
      ),
    );
  }
}
