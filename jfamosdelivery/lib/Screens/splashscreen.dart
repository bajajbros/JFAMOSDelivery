import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:jfamosdelivery/Screens/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool animated = false;
  bool fade = false;
  @override
  void initState() {
    super.initState();
    // Timer(const Duration(seconds: 4), () {
    //   Navigator.of(context).pushReplacement(MaterialPageRoute(
    //     builder: (BuildContext context) => const HomeScreen(),
    //   ));
    // });
    Timer(const Duration(milliseconds: 50), () {
      setState(() {
        animated = true;
      });
    });
    Timer(const Duration(milliseconds: 500), () {
      setState(() {
        fade = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: AnimatedDefaultTextStyle(
            child: const Text('JFamos Delivery'),
            style: animated
                ? GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.bold)
                : GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold),
            duration: const Duration(milliseconds: 400),
          ),
        ),
        const SizedBox(height: 20),
        AnimatedDefaultTextStyle(
          child: const Text('No. 1 Delivery App'),
          style: fade
              ? GoogleFonts.montserrat(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold)
              : GoogleFonts.montserrat(
                  color: Colors.white.withOpacity(0),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
          duration: const Duration(seconds: 1),
        ),
      ],
    );
  }
}
