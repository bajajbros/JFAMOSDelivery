import 'package:flutter/material.dart';
import '../helper/widgets.dart';
import 'enterdestination.dart';
import 'forgetpassword.dart';
import 'mapscreen.dart';

class BikeHome extends StatefulWidget {
  final String phoneNumber;
  const BikeHome({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<BikeHome> createState() => _BikeHomeState();
}

class _BikeHomeState extends State<BikeHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        const MapScreen(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            child: IconButton(
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.grey[800],
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20.0)),
                ),
                isScrollControlled: true,
                builder: (builder) {
                  return const EnterDestinationScreen();
                },
              );
            },
            child: IntrinsicHeight(
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 60,
                      spreadRadius: 5,
                      offset: const Offset(2, -6), // changes position of shadow
                    ),
                  ],
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                        ),
                        width: MediaQuery.of(context).size.width * 0.1,
                        height: MediaQuery.of(context).size.width * 0.015,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Center(
                      child: customTextField(
                        onTap: () {
                          setState(() {
                            ForgetPasswordScreen(
                                phoneNumber: widget.phoneNumber);
                          });
                        },
                        keyboardType: TextInputType.streetAddress,
                        hintText: 'Where to',
                        prefixIcon: Padding(
                          padding: const EdgeInsets.all(12),
                          child: CircleAvatar(
                            backgroundColor: Colors.grey[300],
                            foregroundColor: Colors.white,
                            child: const Icon(Icons.search,
                                color: Color.fromARGB(221, 0, 0, 0)),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
