import 'package:flutter/material.dart';
import 'package:jfamosdelivery/Screens/drawer/profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
                height: MediaQuery.of(context).size.height * 0.12,
                child: DrawerHeader(
                  padding: const EdgeInsets.fromLTRB(0, 16, 8, 8),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey[200],
                        child: const Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
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
                Navigator.pop(context);
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.watch_later,
                color: Colors.black,
              ),
              title: const Text(
                'Ride History',
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.credit_card,
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
                Navigator.pop(context);
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
                Navigator.pop(context);
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
                Navigator.pop(context);
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
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
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
        ],
      ),
    );
  }
}
