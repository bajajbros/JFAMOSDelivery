import 'package:flutter/material.dart';
import 'package:jfamosdelivery/Screens/homescreen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JFamos Delivery',
      home: MaterialApp(
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: const HomeScreen(
          phoneNumber: '9354954343',
        ),
      ),
    );
  }
}
