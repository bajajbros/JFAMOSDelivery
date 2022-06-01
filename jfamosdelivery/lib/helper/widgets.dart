import 'package:flutter/material.dart';
import 'package:jfamosdelivery/helper/consts.dart';
import '../Screens/drawer/contact.dart';
import '../Screens/drawer/historyscreen.dart';
import '../Screens/drawer/payment/paymentscreen.dart';
import '../Screens/drawer/profile.dart';
import '../Screens/drawer/promotions.dart';
import '../Screens/drawer/termsandconditions.dart';

Widget destinationBar(BuildContext context) {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width * 0.035),
              child: const Icon(Icons.fiber_manual_record_rounded,
                  color: Colors.green),
            ),
            const Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 4),
                child: VerticalDivider(
                  color: Colors.black,
                  thickness: 1,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * 0.045),
              child: const Icon(Icons.fiber_manual_record_rounded,
                  color: Colors.red),
            ),
          ],
        ),
      ),
      Expanded(
        flex: 8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From',
              style: TextStyle(
                  fontFamily: 'fredoka',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[500]),
            ),
            const Text(
              'Patel nagar, shadipur metro station',
              style: TextStyle(
                fontFamily: 'fredoka',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            // const Divider(
            //   color: Colors.black,
            //   height: 5,
            //   thickness: 5,
            // ),
            Text(
              'To',
              style: TextStyle(
                  fontFamily: 'fredoka',
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[500]),
            ),
            const Text(
              'Patel nagar, shadipur metro station',
              style: TextStyle(
                fontFamily: 'fredoka',
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
    ],
  );
}

Widget customTextField({
  bool errorText = false,
  String? errorTextMessage,
  String Function(String?)? validator,
  Function? onTap,
  TextEditingController? controller,
  double leftPadding = 30,
  double rightPadding = 30,
  required TextInputType keyboardType,
  required String hintText,
  Widget? prefixIcon,
  bool obsureText = false,
  Widget? suffixIcon,
}) {
  return Padding(
    padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
    child: TextFormField(
      controller: controller,
      obscureText: obsureText,
      enabled: true,
      keyboardType: keyboardType,
      style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: 'fredoka',
          fontWeight: FontWeight.normal),
      decoration: InputDecoration(
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        errorText: errorText ? errorTextMessage : null,
        suffixIcon: suffixIcon,
        prefixIconColor: Colors.black,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: kGreenColor, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kGreenColor, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: kGreenColor, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        filled: true,
        hintStyle: const TextStyle(color: Colors.black38, fontSize: 20),
        hintText: hintText,
        fillColor: Colors.grey[200],
        prefixIcon: prefixIcon,
      ),
    ),
  );
}

InputDecoration customInputDecoration({
  String? errorTextMessage,
  required String hintText,
  required Widget prefixIcon,
  Widget? suffixIcon,
  bool errorText = false,
}) {
  var inputDecoration = InputDecoration(
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    errorText: errorText ? errorTextMessage : null,
    suffixIcon: suffixIcon,
    prefixIconColor: Colors.black,
    border: OutlineInputBorder(
      borderSide: const BorderSide(color: kGreenColor, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kGreenColor, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: kGreenColor, width: 2),
      borderRadius: BorderRadius.circular(12),
    ),
    filled: true,
    hintStyle: const TextStyle(color: Colors.black38, fontSize: 20),
    hintText: hintText,
    fillColor: Colors.grey[200],
    prefixIcon: prefixIcon,
  );
  return inputDecoration;
}

Widget customRoundedButton(
    {double verticalPadding = 22,
    required String text,
    required Function onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(kGreenColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      onPressed: () {
        onPressed();
      },
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: verticalPadding),
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: 'fredoka'),
          ),
        ),
      ),
    ),
  );
}

Widget signinButton(
    {required String? text,
    required Function? onPressed,
    required Image? image}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 30),
    child: ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        side: MaterialStateProperty.all(
          BorderSide(
            color: Colors.grey[600]!,
            width: 0.5,
          ),
        ),
        foregroundColor: MaterialStateProperty.all(Colors.black),
        overlayColor: MaterialStateProperty.all(Colors.white),
        backgroundColor: MaterialStateProperty.all(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      ),
      onPressed: () {
        onPressed!();
      },
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CircleAvatar(
                  radius: 35, backgroundColor: Colors.white, child: image),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(22),
                child: Text(
                  text!,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'fredoka'),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

class CustomAnimatedBottomBar extends StatelessWidget {
  const CustomAnimatedBottomBar({
    Key? key,
    this.selectedIndex = 0,
    this.showElevation = true,
    this.iconSize = 24,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(milliseconds: 270),
    this.mainAxisAlignment = MainAxisAlignment.spaceBetween,
    required this.items,
    required this.onItemSelected,
    this.curve = Curves.linear,
  })  : assert(items.length >= 2 && items.length <= 5),
        super(key: key);

  final int selectedIndex;
  final double iconSize;
  final Color? backgroundColor;
  final bool showElevation;
  final Duration animationDuration;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final MainAxisAlignment mainAxisAlignment;
  final double itemCornerRadius;
  final double containerHeight;
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? Theme.of(context).bottomAppBarColor;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if (showElevation)
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            ),
        ],
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: containerHeight,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Row(
            mainAxisAlignment: mainAxisAlignment,
            children: items.map((item) {
              var index = items.indexOf(item);
              return GestureDetector(
                onTap: () => onItemSelected(index),
                child: _ItemWidget(
                  item: item,
                  iconSize: iconSize,
                  isSelected: index == selectedIndex,
                  backgroundColor: bgColor,
                  itemCornerRadius: itemCornerRadius,
                  animationDuration: animationDuration,
                  curve: curve,
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  final double iconSize;
  final bool isSelected;
  final BottomNavyBarItem item;
  final Color backgroundColor;
  final double itemCornerRadius;
  final Duration animationDuration;
  final Curve curve;

  const _ItemWidget({
    Key? key,
    required this.item,
    required this.isSelected,
    required this.backgroundColor,
    required this.animationDuration,
    required this.itemCornerRadius,
    required this.iconSize,
    this.curve = Curves.linear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      selected: isSelected,
      child: AnimatedContainer(
        width: isSelected ? 130 : 50,
        height: double.maxFinite,
        duration: animationDuration,
        curve: curve,
        decoration: BoxDecoration(
          color:
              isSelected ? item.activeColor.withOpacity(0.2) : backgroundColor,
          borderRadius: BorderRadius.circular(itemCornerRadius),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: isSelected ? 130 : 50,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconTheme(
                  data: IconThemeData(
                    size: iconSize,
                    color: isSelected
                        ? item.activeColor.withOpacity(1)
                        : item.inactiveColor ?? item.activeColor,
                  ),
                  child: item.icon,
                ),
                if (isSelected)
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: DefaultTextStyle.merge(
                        style: TextStyle(
                          color: item.activeColor,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        textAlign: item.textAlign,
                        child: item.title,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavyBarItem {
  BottomNavyBarItem({
    required this.icon,
    required this.title,
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,
  });

  final Widget icon;
  final Widget title;
  final Color activeColor;
  final Color? inactiveColor;
  final TextAlign? textAlign;
}

Drawer drawer(BuildContext context, String phoneNumber) {
  return Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children: <Widget>[
      GestureDetector(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const ProfileScreen()));
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
                        phoneNumber: phoneNumber,
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
            return const Forms(
              pageName: 'terms and conditions',
            );
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Forms(
                        pageName: 'About us',
                      )));
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
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Forms(
                        pageName: 'How to use',
                      )));
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
              fontFamily: 'fredoka',
              color: Colors.black,
              fontWeight: FontWeight.w400),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const Forms(
                        pageName: 'legality',
                      )));
        },
      ),
    ],
  ));
}

Align driverDetailsCard(BuildContext context) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: IntrinsicHeight(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'We found the best ride for you',
                    style: TextStyle(
                        fontFamily: 'fredoka',
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: kGreenColor),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * 0.01,
                  ),
                  ListTile(
                    contentPadding: const EdgeInsets.all(0),
                    minVerticalPadding: 0,
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[300],
                      backgroundImage:
                          const AssetImage('assets/images/mango.png'),
                    ),
                    title: const Text(
                      'John Smith',
                      style: TextStyle(
                        fontFamily: 'fredoka',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: const Text(
                      'Intemidiate',
                      style: TextStyle(
                          fontFamily: 'fredoka',
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: kGreenColor),
                    ),
                    trailing: const Text(
                      '\$22.00',
                      style: TextStyle(
                        fontFamily: 'fredoka',
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  IntrinsicHeight(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                child: Padding(
                                  padding: EdgeInsets.only(left: 4),
                                  child: VerticalDivider(
                                    color: Colors.black,
                                    thickness: 1,
                                  ),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'From',
                                style: TextStyle(
                                    fontFamily: 'fredoka',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[500]),
                              ),
                              const Text(
                                'Patel nagar, shadipur metro station',
                                style: TextStyle(
                                  fontFamily: 'fredoka',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              // const Divider(
                              //   color: Colors.black,
                              //   height: 5,
                              //   thickness: 5,
                              // ),
                              Text(
                                'To',
                                style: TextStyle(
                                    fontFamily: 'fredoka',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey[500]),
                              ),
                              const Text(
                                'Patel nagar, shadipur metro station',
                                style: TextStyle(
                                  fontFamily: 'fredoka',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  customRoundedButton(
                      text: 'Track you drive',
                      onPressed: () {},
                      verticalPadding: 10)
                  // Row(
                  //   crossAxisAlignment: CrossAxisAlignment.center,
                  //   children: [
                  //     // const Spacer(),
                  //     SizedBox(
                  //         child: OutlinedButton(
                  //       onPressed: () {},
                  //       child: Padding(
                  //         padding: EdgeInsets.symmetric(
                  //           vertical: 16,
                  //           horizontal:
                  //               MediaQuery.of(context).size.width * 0.08,
                  //         ),
                  //         child: const Text(
                  //           'Decline',
                  //           style: TextStyle(color: kGreenColor),
                  //         ),
                  //       ),
                  //       style: OutlinedButton.styleFrom(
                  //         side: const BorderSide(
                  //           width: 1.5,
                  //           color: kGreenColor,
                  //         ),
                  //       ),
                  //     )),
                  //     // const Spacer(),
                  //     SizedBox(
                  //       width: MediaQuery.of(context).size.width * 0.04,
                  //     ),
                  //     SizedBox(
                  //       // width: double.infinity,
                  //       child: ElevatedButton(
                  //         onPressed: () {},
                  //         child: Padding(
                  //           padding: EdgeInsets.symmetric(
                  //               vertical: 16,
                  //               horizontal:
                  //                   MediaQuery.of(context).size.width * 0.08),
                  //           child: const Text('Accept'),
                  //         ),
                  //         style: ButtonStyle(
                  //           backgroundColor:
                  //               MaterialStateProperty.all(kGreenColor),
                  //         ),
                  //       ),
                  //     ),

                  //     // const Spacer(),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
