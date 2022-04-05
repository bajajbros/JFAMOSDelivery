import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:jfamosdelivery/Screens/animationscreen.dart';
import 'package:jfamosdelivery/Screens/createpasswordscreen.dart';
import 'package:jfamosdelivery/helper/consts.dart';
import 'package:jfamosdelivery/helper/widgets.dart';
import 'package:http/http.dart' as http;

import 'forgetpassword.dart';

class PasswordScreen extends StatefulWidget {
  final String phoneNumber;
  const PasswordScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  Future checkPassword() async {
    String phoneNumber = widget.phoneNumber;
    String data;
    String password = controller.text;
    var passwordAPI =
        'http://www.jfamoslogistics.com/APIs/APIs2.asmx/LoginwithPassword?mobile=$phoneNumber&password=$password';
    http.Response response = await http.get(
      Uri.parse(passwordAPI),
    );
    if (response.statusCode == 200) {
      data = (response.body);
      print(data);
      var msg = jsonDecode(data)['message'];
      if (msg == "Password Correct.") {
        print('hi');
        return Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnimationScreen(
              phoneNumber: widget.phoneNumber,
            ),
          ),
        );
      } else {
        return const Text('enter a valid password');
      }
    } else {
      print(response.statusCode);
      return (response.statusCode);
    }
  }

  bool _obsureText = true;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const BackButton(color: Colors.black),
          title: const Text(
            'Enter your password',
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
                controller: controller,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obsureText = !_obsureText;
                      });
                    },
                    icon: Icon(
                      _obsureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.black,
                    )),
                obsureText: _obsureText,
                keyboardType: TextInputType.text,
                hintText: 'Password',
                prefixIcon: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Icon(
                    Icons.lock,
                    color: Colors.black,
                  ),
                )),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  const Spacer(),
                  const Text('Oops, you forget your password?',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontFamily: 'fredoka',
                          fontWeight: FontWeight.w400)),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        bottomsheet();
                      });
                    },
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(
                          fontSize: 16,
                          color: kGreenColor,
                          fontFamily: 'fredoka',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            customRoundedButton(
                text: 'Continue',
                onPressed: () async {
                  await checkPassword();
                }),
            const SizedBox(height: 40),
            //add a textfield
          ],
        ));
  }

  bottomsheet() {
    showModalBottomSheet<void>(
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 30),
              OtpTextField(
                focusedBorderColor: kGreenColor,
                keyboardType: TextInputType.number,
                disabledBorderColor: kGreenColor,
                enabledBorderColor: kGreenColor,
                numberOfFields: 5,
                borderColor: Colors.black,
                showFieldAsBox: true,
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {}, // end onSubmit
              ),
              const SizedBox(height: 30),
              const Text(
                  'Please enter the verification code sent to your phone',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontFamily: 'fredoka',
                      fontWeight: FontWeight.w400)),
              const SizedBox(height: 30),
              customRoundedButton(
                  text: 'Verify',
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgetPasswordScreen(
                                  phoneNumber: widget.phoneNumber,
                                )));
                  }),
              const SizedBox(height: 30),
            ],
          );
        });
  }
}
