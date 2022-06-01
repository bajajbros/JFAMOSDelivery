import 'package:flutter/material.dart';
import 'package:jfamosdelivery/Screens/enterdestination.dart';

import '../helper/consts.dart';
import '../helper/widgets.dart';
import 'mapscreen.dart';

class CabHome extends StatefulWidget {
  static bool showPrice = false;
  static bool showDriverDetails = false;
  final String phoneNumber;
  const CabHome({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<CabHome> createState() => _CabHomeState();
}

class _CabHomeState extends State<CabHome> {
  bool navigate = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(context, widget.phoneNumber),
      body: Stack(
        children: [
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
          CabHome.showPrice
              ? priceCard(context)
              : CabHome.showDriverDetails
                  ? driverDetailsCard(context)
                  : firstBottomSheet(context)
        ],
      ),
    );
  }

  Align priceCard(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: IntrinsicHeight(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Expanded(
                  child: destinationBar(context),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Text(
                    'Current Price',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'fredoka'),
                  ),
                  trailing: Text(
                    '9.27\$/km',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'fredoka'),
                  ),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Text(
                    'Your Distance',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'fredoka'),
                  ),
                  trailing: Text(
                    '12.5km',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'fredoka'),
                  ),
                ),
                const ListTile(
                  contentPadding: EdgeInsets.all(0),
                  leading: Text(
                    'Total Price',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'fredoka'),
                  ),
                  trailing: Text(
                    '111.24\$',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'fredoka'),
                  ),
                ),
                customRoundedButton(
                    text: 'Pay 111.24\$ and Book Now',
                    onPressed: () {
                      setState(() {
                        CabHome.showDriverDetails = true;
                        CabHome.showPrice = false;
                        print(CabHome.showDriverDetails);
                      });
                    },
                    verticalPadding: 16)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align firstBottomSheet(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
            ),
            isScrollControlled: true,
            builder: (builder) {
              return const EnterDestinationScreen();
            },
          ).then((value) => setState(() {}));
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
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                    leftPadding: 0,
                    rightPadding: 0,
                    onTap: () {
                      setState(() {
                        navigate = true;
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
    );
  }
}
