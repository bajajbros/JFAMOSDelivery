import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const BackButton(color: Colors.black),
        ),
        body: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Order History',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'fredoka',
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/carbike.png',
                  ),
                  const Text(
                    'No orders yet',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'fredoka',
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
