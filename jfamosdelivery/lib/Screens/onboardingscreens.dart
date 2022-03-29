import 'package:flutter/material.dart';
import 'package:jfamosdelivery/Screens/authscreen.dart';
import 'package:jfamosdelivery/helper/consts.dart';

class Onbording extends StatefulWidget {
  const Onbording({Key? key}) : super(key: key);

  @override
  _OnbordingState createState() => _OnbordingState();
}

class _OnbordingState extends State<Onbording> {
  int currentIndex = 0;
  late PageController _controller;

  // getImageName()async{
  //   var img = await OnBoardingClass().oimage;
  //   return img;
  // }
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              // itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                            'www.jfamoslogistics.com/images/${OnBoardingClass().oimage}'),
                      ),
                      Text(
                        OnBoardingClass().otitle!,
                        style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'fredoka'),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        OnBoardingClass().odescription!,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                          fontFamily: 'fredoka',
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: List.generate(
          //     // contents.length,
          //     (index) => buildDot(
          //       index,
          //       context,
          //     ),
          //   ),
          // ),
          // Container(
          //   height: 60,
          //   margin: const EdgeInsets.all(40),
          //   width: double.infinity,
          // child: ElevatedButton(
          // child: Text(
          //     // currentIndex == contents.length - 1 ? "Continue" : "Next"),
          // onPressed: () {
          //   // if (currentIndex == contents.length - 1) {
          //     Navigator.pushReplacement(
          //       context,
          //       MaterialPageRoute(
          //         builder: (_) => const AuthScreen(),
          //       ),
          //     );
          //   }
          // _controller.nextPage(
          //   duration: const Duration(milliseconds: 100),
          //   curve: Curves.bounceIn,
          // );
          // },
          //   style: ButtonStyle(
          //     backgroundColor: MaterialStateProperty.all(kGreenColor),
          //     foregroundColor: MaterialStateProperty.all(Colors.white),
          //     shape: MaterialStateProperty.all(
          //       RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(30),
          //       ),
          //     ),
          //   ),
          // ),
          // )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: kGreenColor,
      ),
    );
  }
}

class OnBoardingClass {
  int? oid;
  String? oposition;
  String? otitle;
  String? odescription;
  String? oimage;

  OnBoardingClass(
      {this.oid, this.oposition, this.otitle, this.odescription, this.oimage});

  OnBoardingClass.fromJson(Map<String, dynamic> json) {
    oid = json['oid'];
    oposition = json['oposition'];
    otitle = json['otitle'];
    odescription = json['odescription'];
    oimage = json['oimage'];
  }

  Map<String, dynamic> toJson() {
    <String, dynamic>{};
    final Map<String, dynamic> data = <String, dynamic>{};
    data['oid'] = oid;
    data['oposition'] = oposition;
    data['otitle'] = otitle;
    data['odescription'] = odescription;
    data['oimage'] = oimage;
    return data;
  }
}
