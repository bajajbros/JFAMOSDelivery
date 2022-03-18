// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jfamosdelivery/Screens/passwordscreen.dart';
import 'package:jfamosdelivery/helper/widgets.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  var buttonEnabled = false;
  final mobiletec = TextEditingController();

  @override
  void initState() {
    mobiletec.addListener(onMobileChanged);
    super.initState();
  }

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

  void onSendForm() {
    print('sending phone: ${mobiletec.text}');
  }

  String validateMobile(String value) {
// Indian Mobile number are of 10 digit only
    if (value.length != 11) {
      return 'Mobile Number must be of 11 digit';
    } else {
      return "";
    }
  }

  Future sendData() async {
    var url = Uri.parse('www.google.com');
    http.post(url, body: {'phone': mobiletec.text}).then((response) {
      print(response.statusCode);
    });
    print('sending phone: ${mobiletec.text}');
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const PasswordScreen();
                    }));
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
