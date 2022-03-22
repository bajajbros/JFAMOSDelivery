import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jfamosdelivery/Screens/onboardingscreens.dart';
import 'package:jfamosdelivery/helper/consts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool showProgressBar = false;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => const Onbording(),
      ));
    });
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
            child: Image.asset(
              'assets/images/logo.png',
            ),
          ),
          showProgressBar
              ? const CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
              : const CircularProgressIndicator.adaptive(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xff095D2B)),
                )
        ],
      ),
    );
  }
}
