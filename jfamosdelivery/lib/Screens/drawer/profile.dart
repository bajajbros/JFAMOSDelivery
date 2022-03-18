import 'package:flutter/material.dart';
import 'package:jfamosdelivery/helper/consts.dart';
import 'package:jfamosdelivery/helper/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  String? _chosenValue;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabController.index = 1;
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kGreenColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.edit,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
          elevation: 0,
          backgroundColor: kGreenColor,
          title: const Text(
            'Profile',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: 'fredoka',
                color: Colors.white),
          ),
        ),
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                      alignment: Alignment.topLeft,

                      // AppBar().preferredSize.height,
                      color: kGreenColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text('My ',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'fredoka',
                                    color: Colors.white)),
                            Text(
                              '     Profile',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'fredoka',
                                  color: Colors.white),
                            )
                          ],
                        ),
                      )),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 320),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 5,
                      )
                    ],
                  ),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        const Text(
                          'John Doe',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'fredoka',
                              color: Colors.black),
                        ),
                        Text('+977-9876543210',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'fredoka',
                                color: Colors.grey[500])),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(),
                        TabBar(
                          onTap: (index) {
                            setState(() {
                              _tabController.index = index;
                            });
                          },
                          controller: _tabController,
                          unselectedLabelStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            fontFamily: 'fredoka',
                            color: Colors.grey[500],
                          ),
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'fredoka',
                          ),
                          indicatorColor: Colors.transparent,
                          tabs: const [
                            Tab(
                              child: Text(
                                'Personal info',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'fredoka',
                                    color: Colors.black),
                              ),
                            ),
                            Tab(
                              child: Text(
                                'Address',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'fredoka',
                                  color: Colors.black,
                                ),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                alignment: Alignment.topCenter,
                child: CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 50,
                  child: const Icon(
                    Icons.person,
                    color: Colors.grey,
                    size: 50,
                  ),
                ),
              ),
            ),
            TabBarView(controller: _tabController, children: [
              Column(
                children: [
                  // create a card for showing email

                  Padding(
                    padding:
                        const EdgeInsets.only(top: 320, left: 30, right: 30),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: kGreenColor, width: 3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 20,
                      child: ListTile(
                        leading: Icon(
                          Icons.email,
                          color: Colors.grey[500],
                          size: 30,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: Text(
                            'Email',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'fredoka',
                                color: Colors.grey[500]),
                          ),
                        ),
                        subtitle: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                          child: Text(
                            'someone@gmail.com',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'fredoka',
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(color: kGreenColor, width: 3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      borderOnForeground: false,
                      elevation: 20,
                      child: ListTile(
                        leading: Icon(
                          Icons.smartphone,
                          color: Colors.grey[500],
                          size: 30,
                        ),
                        title: Padding(
                          padding: const EdgeInsets.only(top: 14),
                          child: Text(
                            'Phone Number',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'fredoka',
                                color: Colors.grey[500]),
                          ),
                        ),
                        subtitle: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 8, 8, 8),
                          child: Text(
                            '+234-9876543210',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'fredoka',
                                color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 320,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: customTextField(
                            padding: 16,
                            keyboardType: TextInputType.streetAddress,
                            hintText: 'House no',
                            prefixIcon: const Icon(
                              Icons.house,
                              color: kGreenColor,
                            ),
                          ),
                        ),
                        Expanded(
                          child: customTextField(
                            padding: 16,
                            keyboardType: TextInputType.streetAddress,
                            hintText: 'Street details',
                            prefixIcon: const Icon(
                              Icons.streetview,
                              color: kGreenColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: kGreenColor,
                                width: 2,
                              ),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 8,
                                ),
                                const Icon(Icons.location_city,
                                    color: kGreenColor),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: DropdownButton<String>(
                                    isExpanded: true,
                                    focusColor: Colors.grey[200],
                                    value: _chosenValue,
                                    //elevation: 5,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontFamily: 'fredoka'),
                                    iconEnabledColor: Colors.black,
                                    items: <String>[
                                      'Lagos',
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: const TextStyle(
                                              color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                    hint: const Text(
                                      "City",
                                      style: TextStyle(
                                          color: Colors.black38,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'fredoka'),
                                    ),
                                    onChanged: (String? value) {
                                      setState(() {
                                        _chosenValue = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: customTextField(
                          padding: 16,
                          keyboardType: TextInputType.number,
                          hintText: 'Pin Code',
                          prefixIcon: const Icon(
                            Icons.location_on,
                            color: kGreenColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: customTextField(
                      padding: 16,
                      keyboardType: TextInputType.streetAddress,
                      hintText: 'Area details/landmark to locate you',
                      prefixIcon: const Icon(
                        Icons.location_city,
                        color: kGreenColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  customRoundedButton(text: 'Update address', onPressed: () {}),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ])
          ],
        ),
      ),
    );
    // body: Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    // CircleAvatar(
    //   backgroundColor: Colors.grey[200],
    //   radius: 70,
    //   child: const Icon(
    //     Icons.person,
    //     color: Colors.grey,
    //     size: 70,
    //   ),
    // ),
    //       const SizedBox(height: 20),
    //       const Text(
    //         'John Doe',
    //         style: TextStyle(
    //           fontSize: 30,
    //           fontWeight: FontWeight.w400,
    //           fontFamily: 'fredoka',
    //           color: Colors.black,
    //         ),
    //       ),
    //       const SizedBox(
    //         height: 40,
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 30),
    //         child: Container(
    //           decoration: BoxDecoration(
    //               borderRadius: const BorderRadius.all(Radius.circular(16)),
    //               color: Colors.grey[200]),
    //           child: Column(
    //             children: const [
    //               Padding(
    //                 padding: EdgeInsets.all(8.0),
    //                 child: ListTile(
    //                   leading: Icon(
    //                     Icons.email,
    //                     color: kGreenColor,
    //                   ),
    //                   title: Text(
    //                     'mayankbajaj.mahi19@gmail.com',
    //                     style: TextStyle(
    //                         fontSize: 20,
    //                         fontWeight: FontWeight.w400,
    //                         fontFamily: 'fredoka',
    //                         color: Colors.black),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       const SizedBox(
    //         height: 20,
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal: 30),
    //         child: Container(
    //           decoration: BoxDecoration(
    //               borderRadius: const BorderRadius.all(Radius.circular(16)),
    //               color: Colors.grey[200]),
    //           child: Column(
    //             children: const [
    //               Padding(
    //                 padding: EdgeInsets.all(8.0),
    //                 child: ListTile(
    //                   leading: Icon(
    //                     Icons.phone,
    //                     color: kGreenColor,
    //                   ),
    //                   title: Text(
    //                     '+91-9888888888',
    //                     style: TextStyle(
    //                         fontSize: 20,
    //                         fontWeight: FontWeight.w400,
    //                         fontFamily: 'fredoka',
    //                         color: Colors.black),
    //                   ),
    //                 ),
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       const SizedBox(
    //         height: 20,
    //       ),
    //       signinButton(
    //           text: 'Connect to Google',
    //           onPressed: () {},
    //           image: Image.asset('assets/images/googlelogoo.png')),
    //       const SizedBox(
    //         height: 20,
    //       ),
    //       signinButton(
    //           text: 'Connect to Facebook',
    //           onPressed: () {},
    //           image: Image.asset('assets/images/fblogo.png')),
    //     ],
    //   ),
    // ),
  }
}
