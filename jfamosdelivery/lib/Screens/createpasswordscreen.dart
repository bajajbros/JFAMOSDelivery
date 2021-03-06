import 'package:flutter/material.dart';
import 'package:jfamosdelivery/Screens/animationscreen.dart';
import 'package:jfamosdelivery/helper/widgets.dart';
import 'package:http/http.dart' as http;

class CreatePasswordScreen extends StatefulWidget {
  final String phoneNumber;
  const CreatePasswordScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<CreatePasswordScreen> createState() => _CreatePasswordScreenState();
}

class _CreatePasswordScreenState extends State<CreatePasswordScreen> {
  bool errorText = false;
  String? password;
  TextEditingController enterPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  getPassword() {
    if (confirmPasswordController.text == enterPasswordController.text) {
      password = confirmPasswordController.text;
    }
    return password;
  }

  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  showErrorText() async {
    var password = enterPasswordController.text;
    if (validateStructure(password)) {
      setState(() {
        errorText = true;
      });
    } else {
      await createPassword().then(
        (value) => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AnimationScreen(
              phoneNumber: widget.phoneNumber,
            ),
          ),
        ),
      );
    }
  }

  Future createPassword() async {
    password = getPassword();
    String phoneNumber = widget.phoneNumber;
    var createPasswordAPI =
        'http://www.jfamoslogistics.com/APIs/APIs2.asmx/Register?phone=$phoneNumber&password=$password';
    http.Response response = await http.get(
      Uri.parse(createPasswordAPI),
    );
    if (response.statusCode == 200) {
      return response.body;
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
              errorText: errorText,
              errorTextMessage: 'Please enter a valid password',
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
                  await showErrorText();
                }),
            const SizedBox(height: 40),
            //add a textfield
          ],
        ));
  }
}
