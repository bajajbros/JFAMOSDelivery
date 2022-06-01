import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jfamosdelivery/Screens/onboardingscreens.dart';
import 'package:jfamosdelivery/backend/apis.dart';
import 'package:jfamosdelivery/helper/consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int? seconds;
  getImageName() async {
    var data = await splashScreenData();
    var imageName = jsonDecode(data.toString())[0]['simage'];
    // print(imageName);
    return imageName;
  }

  getDuration() async {
    var data = await splashScreenData();
    var duration = jsonDecode(data.toString())[0]['sDuration'];
    // print(duration);
    return int.parse(duration);
  }

  showTimer() async {
    Timer(Duration(seconds: await getDuration()), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => const OnBoardingScreen(),
      ));
    });
  }

  bool showProgressBar = false;
  @override
  void initState() {
    getDuration();
    splashScreenData();
    showTimer();
    super.initState();

    Timer(const Duration(seconds: 1), () {
      setState(() {
        showProgressBar = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGreenColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: FutureBuilder(
              builder: (context, snapshot) {
                return snapshot.data != null
                    ? Image.network(
                        'http://jfamoslogistics.com/images/${snapshot.data}')
                    : Center(child: Container());
              },
              future: getImageName(),
            ),
          ),
          showProgressBar
              ? const CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : const CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff095D2B)),
                ),
        ],
      ),
    );
  }
}
