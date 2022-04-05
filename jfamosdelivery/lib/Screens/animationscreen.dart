import 'dart:async';

import 'package:flutter/material.dart';
import 'package:jfamosdelivery/Screens/homescreen.dart';
import 'package:lottie/lottie.dart';

class AnimationScreen extends StatefulWidget {
  final String phoneNumber;
  const AnimationScreen({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(
                phoneNumber: widget.phoneNumber,
              )));
    });

    super.initState();
  }

  // navigation() {
  //   Timer(const Duration(seconds: 4), () {
  //     Navigator.of(context).push(MaterialPageRoute(
  //         builder: (BuildContext context) => const HomeScreen()));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Lottie.asset(
            'assets/animations/animation.json',
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
    ));
  }
}
