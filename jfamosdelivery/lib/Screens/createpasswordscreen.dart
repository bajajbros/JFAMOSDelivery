import 'package:flutter/material.dart';
import 'package:jfamosdelivery/Screens/animationscreen.dart';
import 'package:jfamosdelivery/helper/widgets.dart';

class CreatePasswordScreen extends StatefulWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const BackButton(color: Colors.black),
          title: const Text(
            'Create Password',
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnimationScreen()));
                }),
            const SizedBox(height: 40),
            //add a textfield
          ],
        ));
  }
}
