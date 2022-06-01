import 'package:flutter/material.dart';
import 'package:jfamosdelivery/Screens/cabhome.dart';
import '../helper/widgets.dart';

class EnterDestinationScreen extends StatefulWidget {
  const EnterDestinationScreen({Key? key}) : super(key: key);

  @override
  State<EnterDestinationScreen> createState() => _EnterDestinationScreenState();
}

class _EnterDestinationScreenState extends State<EnterDestinationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black,
              size: 32,
            )),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'Select Destination',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            // height: MediaQuery.of(context).size.width * 0.25,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                IntrinsicHeight(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  top: MediaQuery.of(context).size.width *
                                      0.035),
                              child: const Icon(
                                  Icons.fiber_manual_record_rounded,
                                  color: Colors.green),
                            ),
                            const Expanded(
                              child: VerticalDivider(
                                color: Colors.black,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).size.width *
                                      0.045),
                              child: const Icon(
                                  Icons.fiber_manual_record_rounded,
                                  color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                          flex: 8,
                          child: Column(
                            children: [
                              customTextField(
                                leftPadding: 4,
                                rightPadding: 4,
                                keyboardType: TextInputType.streetAddress,
                                hintText: 'Search pick-up location',
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              customTextField(
                                leftPadding: 4,
                                rightPadding: 4,
                                keyboardType: TextInputType.streetAddress,
                                hintText: 'Destination',
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          customRoundedButton(
              text: 'Check Fare',
              onPressed: () {
                setState(() {
                  CabHome.showPrice = true;
                  Navigator.pop(context);
                });
              }),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
        ],
      ),
    );
  }
}
