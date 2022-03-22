import 'package:flutter/material.dart';
import 'package:jfamosdelivery/helper/consts.dart';

Widget customTextField({
  double leftPadding = 30,
  double rightPadding = 30,
  required TextInputType keyboardType,
  required String hintText,
  required Widget prefixIcon,
  bool obsureText = false,
  Widget? suffixIcon,
}) {
  return Padding(
    padding: EdgeInsets.only(left: leftPadding, right: rightPadding),
    child: TextFormField(
      obscureText: obsureText,
      enabled: true,
      keyboardType: keyboardType,
      style: const TextStyle(
          fontSize: 20,
          color: Colors.black,
          fontFamily: 'fredoka',
          fontWeight: FontWeight.normal),
      decoration: InputDecoration(
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

Widget customRoundedButton(
    {required String text, required Function onPressed}) {
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
          padding: const EdgeInsets.symmetric(vertical: 22),
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
