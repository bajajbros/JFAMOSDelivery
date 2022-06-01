import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:jfamosdelivery/helper/consts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  Future getData({required String contactType}) async {
    var api =
        'http://www.jfamoslogistics.com/APIs/APIs2.asmx/Contact?contacttype=$contactType';
    var data = await http.get(Uri.parse(api));

    if (data.statusCode == 200) {
      // print(data.body);
      String detail = await jsonDecode(data.body)[0]['cdetail'];
      // print(detail);
      return detail;
    } else {
      throw Exception('Failed to load data, statusCode: ${data.statusCode}');
    }
  }

  String? phoneNumber;
  String? emailAddress;
  String? whatsappNumber;
  String? facebook;
  String? instagram;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const BackButton(color: Colors.black),
        title: const Text(
          'Contact us',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              fontFamily: 'fredoka',
              color: Colors.black),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Get In Touch',
            style: TextStyle(
                fontSize: 38,
                fontFamily: 'fredoka',
                color: kGreenColor,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: (() async {
                String email = await getData(contactType: 'Email');
                await launch('mailto:$email?subject=&body=');
                // setState(() {
                //   email = emailAddress!;
                // });
              }),
              child: Card(
                color: kGreenColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '$emailAddress',
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'fredoka',
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: (() async {
                String number = await getData(contactType: 'contactNumber');
                launch('tel:$number');
              }),
              child: Card(
                color: kGreenColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '$phoneNumber',
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'fredoka',
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: (() async {
                String number = await getData(contactType: 'whatsapp');
                await getData(contactType: 'whatsapp');
                launch('https://wa.me/$number');
              }),
              child: Card(
                color: kGreenColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.whatsapp,
                        color: Colors.white,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Text(
                        '$whatsappNumber',
                        style: const TextStyle(
                            fontSize: 20,
                            fontFamily: 'fredoka',
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: (() async {
                String fb = await getData(contactType: 'facebook');
                launch('https://www.facebook.com/$fb');
              }),
              child: Card(
                color: kGreenColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.facebook,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'JFamoslogestics',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'fredoka',
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: (() async {
                String insta = await getData(contactType: 'instagram');
                launch(insta);
              }),
              child: Card(
                color: kGreenColor,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add_box,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'jfamoslogestics',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'fredoka',
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      )
                    ],
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
