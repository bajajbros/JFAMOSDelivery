import 'dart:async';
import 'package:flutter/material.dart';
import 'package:jfamosdelivery/homescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => const HomeScreen(),
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
            child: Text('JFAMOS DELIVERY',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))),
      ],
    );
  }
}
