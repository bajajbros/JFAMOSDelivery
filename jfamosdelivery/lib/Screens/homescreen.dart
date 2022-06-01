import 'package:flutter/material.dart';
import 'package:jfamosdelivery/Screens/bikehome.dart';
import 'package:jfamosdelivery/Screens/cabhome.dart';
import 'package:jfamosdelivery/Screens/drawer/profile.dart';
import 'package:jfamosdelivery/fooddeliverymain/foodhome.dart';
import 'package:jfamosdelivery/helper/consts.dart';
import 'package:jfamosdelivery/helper/widgets.dart';

class HomeScreen extends StatefulWidget {
  final String phoneNumber;
  const HomeScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedPage = 0;

  final _inactiveColor = Colors.grey;
  int _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // bool _isOpened = false;
  double topContainerHeight = 0.3;

  Widget getBody() {
    List<Widget> pages = [
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Home",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Users",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Messages",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Settings",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.white,
      selectedIndex: _currentIndex,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      onItemSelected: (index) => setState(() => _currentIndex = index),
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.delivery_dining),
          title: const Text('Bike'),
          activeColor: kGreenColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.local_taxi),
          title: const Text('Cab'),
          activeColor: kGreenColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.restaurant),
          title: const Text(
            'Food ',
          ),
          activeColor: kGreenColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.person),
          title: const Text(
            'Profile ',
          ),
          activeColor: kGreenColor,
          inactiveColor: _inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final _pageOptions = [
      CabHome(phoneNumber: widget.phoneNumber),
      BikeHome(phoneNumber: widget.phoneNumber),
      const FoodHomePage(),
      const ProfileScreen()
    ];
    return Scaffold(
      bottomNavigationBar: _buildBottomBar(),
      key: _scaffoldKey,
      drawer: drawer(context, widget.phoneNumber),
      body: _pageOptions[_currentIndex],
      // body: Stack(children: [
      //   const MapScreen(),
      //   Padding(
      //     padding: const EdgeInsets.all(16.0),
      //     child: Container(
      //       decoration: const BoxDecoration(
      //         color: Colors.white,
      //         shape: BoxShape.circle,
      //         boxShadow: [
      //           BoxShadow(
      //             color: Colors.black12,
      //             blurRadius: 10,
      //             spreadRadius: 2,
      //           ),
      //         ],
      //       ),
      // child: Padding(
      //   padding: const EdgeInsets.all(4.0),
      //   child: CircleAvatar(
      //     backgroundColor: Colors.white,
      //     foregroundColor: Colors.black,
      //     child: IconButton(
      //       onPressed: () {
      //         _scaffoldKey.currentState?.openDrawer();
      //       },
      //       icon: Icon(
      //         Icons.menu_rounded,
      //         color: Colors.grey[800],
      //       ),
      //     ),
      //   ),
      // ),
      //     ),
      //   ),
      //   Align(
      //     alignment: Alignment.bottomCenter,
      //     child: GestureDetector(
      //       onTap: () {
      //         showModalBottomSheet(
      //             context: context,
      //             backgroundColor: Colors.white,
      //             shape: const RoundedRectangleBorder(
      //               borderRadius:
      //                   BorderRadius.vertical(top: Radius.circular(20.0)),
      //             ),
      //             isScrollControlled: true,
      //             builder: (builder) {
      //               return ForgetPasswordScreen(
      //                   phoneNumber: widget.phoneNumber);
      //             });
      //       },
      //       child: IntrinsicHeight(
      //         child: Container(
      //           decoration: BoxDecoration(
      //             boxShadow: [
      //               BoxShadow(
      //                 color: Colors.black.withOpacity(0.15),
      //                 blurRadius: 60,
      //                 spreadRadius: 5,
      //                 offset: const Offset(2, -6), // changes position of shadow
      //               ),
      //             ],
      //             borderRadius: const BorderRadius.vertical(
      //               top: Radius.circular(24),
      //             ),
      //             color: Colors.white,
      //           ),
      //           child: Column(
      //             mainAxisAlignment: MainAxisAlignment.end,
      //             children: [
      //               SizedBox(
      //                 height: MediaQuery.of(context).size.height * 0.03,
      //               ),
      //               Center(
      //                 child: Container(
      //                   decoration: BoxDecoration(
      //                     color: Colors.grey[300],
      //                     borderRadius:
      //                         const BorderRadius.all(Radius.circular(20)),
      //                   ),
      //                   width: MediaQuery.of(context).size.width * 0.1,
      //                   height: MediaQuery.of(context).size.width * 0.015,
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).size.height * 0.03,
      //               ),
      //               Center(
      //                 child: customTextField(
      //                   onTap: () {
      //                     setState(() {
      //                       ForgetPasswordScreen(
      //                           phoneNumber: widget.phoneNumber);
      //                     });
      //                   },
      //                   keyboardType: TextInputType.streetAddress,
      //                   hintText: 'Where to',
      //                   prefixIcon: Padding(
      //                     padding: const EdgeInsets.all(12),
      //                     child: CircleAvatar(
      //                       backgroundColor: Colors.grey[300],
      //                       foregroundColor: Colors.white,
      //                       child: const Icon(Icons.search,
      //                           color: Color.fromARGB(221, 0, 0, 0)),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               SizedBox(
      //                 height: MediaQuery.of(context).size.height * 0.03,
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // BottomDrawer(
      //   callback: (opened) {
      //     _isOpened ? opened = true : false;
      //   },
      //   cornerRadius: 24,
      //   header: Center(
      //     child: Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Container(
      //         decoration: BoxDecoration(
      //           color: Colors.grey[300],
      //           borderRadius: const BorderRadius.all(Radius.circular(20)),
      //         ),
      //         width: MediaQuery.of(context).size.width * 0.1,
      //         height: MediaQuery.of(context).size.width * 0.015,
      //       ),
      //     ),
      //   ),
      //   body: customTextField(
      //     onTap: () {
      //       setState(() {
      //         _isOpened = true;
      //       });
      //     },
      //     keyboardType: TextInputType.streetAddress,
      //     hintText: 'Where to',
      //     prefixIcon: Padding(
      //       padding: const EdgeInsets.all(12),
      //       child: CircleAvatar(
      //         backgroundColor: Colors.grey[300],
      //         foregroundColor: Colors.white,
      //         child: const Icon(Icons.search,
      //             color: Color.fromARGB(221, 0, 0, 0)),
      //       ),
      //     ),
      //   ),
      //   headerHeight: MediaQuery.of(context).size.height * 0.16,
      //   drawerHeight: MediaQuery.of(context).size.height * 0.75,
      //   color: Colors.white,
      //   boxShadow: [
      //     BoxShadow(
      //       color: Colors.black.withOpacity(0.15),
      //       blurRadius: 60,
      //       spreadRadius: 5,
      //       offset: const Offset(2, -6), // changes position of shadow
      //     ),
      //   ],
      // ),
      // AnimatedContainer(
      //   duration: const Duration(milliseconds: 300),
      //   height: MediaQuery.of(context).size.height * (_isOpened ? 0.3 : 0),
      //   color: Colors.white,
      // ),
    );
  }
}


// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   int selectedPage = 0;

//   final _pageOptions = [const HomeScreen(), InboxScreen(), SignInScreen()];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: _pageOptions[selectedPage],
//         bottomNavigationBar: BottomNavigationBar(
//           items: const [
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.home, size: 30), title: Text('Home')),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.mail, size: 30), title: Text('Inbox')),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.account_circle, size: 30),
//                 title: Text('Account')),
//           ],
//           selectedItemColor: Colors.green,
//           elevation: 5.0,
//           unselectedItemColor: Colors.green[900],
//           currentIndex: selectedPage,
//           backgroundColor: Colors.white,
//           onTap: (index) {
//             setState(() {
//               selectedPage = index;
//             });
//           },
//         ));
//   }
// }
