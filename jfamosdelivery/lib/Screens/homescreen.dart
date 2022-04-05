import 'package:bottom_drawer/bottom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:jfamosdelivery/Screens/drawer/about.dart';
import 'package:jfamosdelivery/Screens/drawer/contact.dart';
import 'package:jfamosdelivery/Screens/drawer/historyscreen.dart';
import 'package:jfamosdelivery/Screens/drawer/howtouse.dart';
import 'package:jfamosdelivery/Screens/drawer/legal.dart';
import 'package:jfamosdelivery/Screens/drawer/payment/paymentscreen.dart';
import 'package:jfamosdelivery/Screens/drawer/profile.dart';
import 'package:jfamosdelivery/Screens/drawer/promotions.dart';
import 'package:jfamosdelivery/Screens/drawer/termsandconditions.dart';
import 'package:jfamosdelivery/Screens/mapscreen.dart';
import 'package:jfamosdelivery/helper/widgets.dart';

class HomeScreen extends StatefulWidget {
  final String phoneNumber;
  const HomeScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _isOpened = false;
  double topContainerHeight = 0.3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfileScreen()));
              },
              child: SizedBox(
                height: 180,
                width: double.infinity,
                child: DrawerHeader(
                  padding: const EdgeInsets.fromLTRB(0, 16, 8, 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[200],
                        child: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mayank Bajaj',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'fredoka'),
                            ),
                            Text(
                              'Edit profile',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'fredoka',
                                  color: Colors.grey[500],
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.credit_card,
                color: Colors.black,
              ),
              title: const Text(
                'Payment',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'fredoka',
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaymentScreen(
                              phoneNumber: widget.phoneNumber,
                            )));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.discount,
                color: Colors.black,
              ),
              title: const Text(
                'Promotions',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'fredoka',
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Promotions();
                }));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.watch_later,
                color: Colors.black,
              ),
              title: const Text(
                'History',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'fredoka',
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const HistoryScreen();
                }));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.delivery_dining,
                color: Colors.black,
              ),
              title: const Text(
                'Sign up as delivery Boy',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'fredoka',
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.chat,
                color: Colors.black,
              ),
              title: const Text(
                'Support',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'fredoka',
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Terms();
                }));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.contact_phone,
                color: Colors.black,
              ),
              title: const Text(
                'Contact us',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'fredoka',
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const Contact();
                }));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.info,
                color: Colors.black,
              ),
              title: const Text(
                'About us',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'fredoka',
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const About()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.help,
                color: Colors.black,
              ),
              title: const Text(
                'How to use',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'fredoka',
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HowToUser()));
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.line_weight_outlined,
                color: Colors.black,
              ),
              title: const Text(
                'Legality',
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'fredoka',
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Legal()));
              },
            ),
          ],
        ),
      ),
      body: Stack(children: [
        const MapScreen(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
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
          ),
        ),
        BottomDrawer(
          callback: (opened) {
            _isOpened ? opened = true : false;
          },
          cornerRadius: 24,
          header: Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                width: MediaQuery.of(context).size.width * 0.1,
                height: MediaQuery.of(context).size.width * 0.015,
              ),
            ),
          ),
          body: customTextField(
            onTap: () {
              setState(() {
                _isOpened = true;
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
          headerHeight: MediaQuery.of(context).size.height * 0.16,
          drawerHeight: MediaQuery.of(context).size.height * 0.75,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              blurRadius: 60,
              spreadRadius: 5,
              offset: const Offset(2, -6), // changes position of shadow
            ),
          ],
        ),
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: MediaQuery.of(context).size.height * (_isOpened ? 0.3 : 0),
          color: Colors.white,
        ),
      ]),
    );
  }
}
