import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:jfamosdelivery/helper/widgets.dart';

import 'createpasswordscreen.dart';
import 'passwordscreen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool errorText = false;
  showErrorText() async {
    var lenght = mobiletec.text.length;
    if (lenght.clamp(9, 11) != lenght) {
      setState(() {
        errorText = true;
      });
    } else {
      await login();
    }
  }

  Future login() async {
    String data;
    int phoneNumber = int.parse(mobiletec.text);
    var authAPI =
        'http://www.jfamoslogistics.com/APIs/APIs2.asmx/Login?phone=$phoneNumber';
    http.Response response = await http.get(
      Uri.parse(authAPI),
    );
    if (response.statusCode == 200) {
      data = (response.body);
      print(data);
      var msg = jsonDecode(data)['message'];
      if (msg == 'Login Failed.') {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreatePasswordScreen(
              phoneNumber: mobiletec.text,
            ),
          ),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PasswordScreen(
              phoneNumber: mobiletec.text,
            ),
          ),
        );
      }
    } else {
      return (response.statusCode);
    }
  }

//Successfully Registered.
//Successfully Loggedin.
  // navigate() async {
  //   String response = await login();
  //   var msg = jsonDecode(response)['message'];
  //   if (msg == 'Successfully Registered.') {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => CreatePasswordScreen(
  //           phoneNumber: int.parse(mobiletec.text),
  //         ),
  //       ),
  //     );
  //   } else if (msg == 'Successfully Loggedin.') {
  //     Navigator.push(
  //       context,
  //       MaterialPageRoute(
  //         builder: (context) => PasswordScreen(
  //           phoneNumber: int.parse(mobiletec.text),
  //         ),
  //       ),
  //     );
  //   }
  // }

  var buttonEnabled = false;
  final mobiletec = TextEditingController();

  // @override
  // void initState() {
  //   // mobiletec.addListener(onMobileChanged);

  //   super.initState();
  // }

  void onMobileChanged() {
    var val = mobiletec.text;
    if (val.length == 11) {
      buttonEnabled = true;
    } else {
      buttonEnabled = false;
    }
    setState(() {});
  }

  @override
  void dispose() {
    mobiletec.dispose();
    super.dispose();
  }

  FocusNode f1 = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.25,
              ),
              const Text(
                'Enter your number',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    fontFamily: 'fredoka'),
              ),
              const SizedBox(height: 20),
              customTextField(
                errorTextMessage: 'Please enter a valid number',
                errorText: errorText,
                controller: mobiletec,
                hintText: 'Mobile Number',
                keyboardType: TextInputType.number,
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.phone,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        '+234',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'fredoka',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              customRoundedButton(
                  text: 'Next',
                  onPressed: () async {
                    await showErrorText();
                    // await navigate();
                  }),
              const SizedBox(
                height: 20,
              ),
              Row(children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                    ),
                  ),
                ),
                const Text('OR',
                    style: TextStyle(fontSize: 16, fontFamily: 'fredoka')),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Divider(
                      color: Colors.grey[300],
                      thickness: 1,
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 30,
              ),
              signinButton(
                  image: Image.asset('assets/images/googlelogoo.png'),
                  text: 'SignIn with Google',
                  onPressed: () {
                    print('hi');
                  }),
              const SizedBox(
                height: 20,
              ),
              signinButton(
                text: 'SignIn with Facebook',
                onPressed: () {},
                image: Image.asset('assets/images/fblogo.png'),
              ),
              const Spacer(),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 40),
              //   child: Row(
              //     children: [
              //       Flexible(
              //         child: RichText(
              //           textAlign: TextAlign.center,
              //           text: TextSpan(
              //             text: 'By signing up you agree to our ',
              //             style: const TextStyle(
              //                 color: Colors.black,
              //                 fontSize: 16,
              //                 fontFamily: 'fredoka',
              //                 fontWeight: FontWeight.w400),
              //             children: [
              //               WidgetSpan(
              //                 child: TextButton(
              //                   onPressed: () {},
              //                   child: const Padding(
              //                     padding: EdgeInsets.only(top: 7, right: 6),
              //                     child: Text('Terms of Service',
              //                         style: TextStyle(
              //                             color: kGreenColor,
              //                             fontSize: 16,
              //                             fontFamily: 'fredoka',
              //                             fontWeight: FontWeight.w400)),
              //                   ),
              //                 ),
              //               ),
              //               const WidgetSpan(
              //                 child: Padding(
              //                   padding: EdgeInsets.only(bottom: 8),
              //                   child: Text(' and ',
              //                       style: TextStyle(
              //                           color: Colors.black,
              //                           fontSize: 16,
              //                           fontFamily: 'fredoka',
              //                           fontWeight: FontWeight.w400)),
              //                 ),
              //               ),
              //               WidgetSpan(
              //                 child: TextButton(
              //                   onPressed: () {},
              //                   child: const Text('Privacy Policy',
              //                       style: TextStyle(
              //                           color: kGreenColor,
              //                           fontSize: 16,
              //                           fontFamily: 'fredoka',
              //                           fontWeight: FontWeight.w400)),
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
