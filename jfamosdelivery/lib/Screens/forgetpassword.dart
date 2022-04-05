import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:jfamosdelivery/helper/widgets.dart';
import 'package:http/http.dart' as http;

import 'animationscreen.dart';

class ForgetPasswordScreen extends StatefulWidget {
  final String phoneNumber;
  const ForgetPasswordScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreen();
}

class _ForgetPasswordScreen extends State<ForgetPasswordScreen> {
  String? password;
  TextEditingController enterPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  getPassword() {
    if (confirmPasswordController.text == enterPasswordController.text) {
      password = confirmPasswordController.text;
    }
    return password;
  }

  Future createPassword() async {
    password = getPassword();
    String phoneNumber = widget.phoneNumber;
    var createPasswordAPI =
        'http://www.jfamoslogistics.com/APIs/APIs2.asmx/ForgotPassword?pass=$password&mobile=$phoneNumber';
    http.Response response = await http.get(
      Uri.parse(createPasswordAPI),
    );
    if (response.statusCode == 200) {
      String data = jsonDecode(response.body)['message'];
      if (data == 'Successfully Changed!') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnimationScreen(
              phoneNumber: widget.phoneNumber,
            ),
          ),
        );
      } else {
        return data;
      }
    } else {
      return (response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const BackButton(color: Colors.black),
          title: const Text(
            'Reset Password',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: 'fredoka',
                color: Colors.black),
          ),
        ),
        body: Column(
          children: [
            customTextField(
              controller: enterPasswordController,
              hintText: 'Enter Your Password',
              keyboardType: TextInputType.text,
              prefixIcon: const Padding(
                padding: EdgeInsets.all(16),
                child: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            customTextField(
              controller: confirmPasswordController,
              hintText: 'Confirm Your Password',
              keyboardType: TextInputType.text,
              prefixIcon: const Padding(
                padding: EdgeInsets.all(16),
                child: Icon(
                  Icons.lock,
                  color: Colors.black,
                ),
              ),
            ),
            const Spacer(),
            customRoundedButton(
                text: 'Continue',
                onPressed: () async {
                  await createPassword();
                }),
            const SizedBox(height: 40),
            //add a textfield
          ],
        ));
  }
}
