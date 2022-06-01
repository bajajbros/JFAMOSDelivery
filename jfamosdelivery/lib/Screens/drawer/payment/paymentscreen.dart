import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:jfamosdelivery/Screens/drawer/payment/addcard.dart';
import 'package:jfamosdelivery/backend/apis.dart';
import 'package:jfamosdelivery/helper/widgets.dart';
import 'package:http/http.dart' as http;

class PaymentScreen extends StatefulWidget {
  final String phoneNumber;
  const PaymentScreen({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int? cardID;
  Future delereCard() async {
    var id = cardID;
    // print(id);
    var response = await getData(
        api:
            'http://www.jfamoslogistics.com/APIs/APIs2.asmx/DeletePayment?id=$id&usercontactno=${widget.phoneNumber}');
    // print(response);
    setState(() {});
    return response;
  }

  Future<List<CreditCardDetails>>? futureData;

  @override
  void initState() {
    super.initState();
    futureData = getCreditCards();
  }

  Future<List<CreditCardDetails>> getCreditCards() async {
    Uri api = Uri.parse(
        'http://www.jfamoslogistics.com/APIs/APIs2.asmx/DisplayPayment?usercontactno=${widget.phoneNumber}');
    final response = await http.get(api);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((data) => CreditCardDetails.fromJson(data))
          .toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        title: const Text('Payment',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'fredoka',
                color: Colors.black)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<List<CreditCardDetails>>(
                stream: futureData?.asStream(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<CreditCardDetails> data = snapshot.data!;
                    return Expanded(
                      child: ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (BuildContext context, int index) {
                            cardID = data[index].pid;
                            return GestureDetector(
                              onLongPress: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text('Delete Card'),
                                        content: const Text(
                                            'Are you sure you want to delete this card?'),
                                        actions: [
                                          ElevatedButton(
                                              child: const Text('Cancel'),
                                              onPressed: () async {
                                                Navigator.pop(context);
                                              }),
                                          ElevatedButton(
                                            child: const Text('Delete'),
                                            onPressed: () async {
                                              await delereCard();
                                              await getCreditCards();
                                              Navigator.pop(context);
                                              setState(() {
                                                futureData = getCreditCards();
                                              });
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              child: CreditCardWidget(
                                  backgroundImage:
                                      'assets/images/gradient.jpeg',
                                  cardNumber: data[index].usercardno!,
                                  expiryDate: data[index].userexpirycode!,
                                  cardHolderName: data[index].userhno!,
                                  cvvCode: data[index].usersecurecode!,
                                  showBackView: false,
                                  onCreditCardWidgetChange: (value) {}),
                            );
                          }),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const Text(
                    'No cards added',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'fredoka',
                        color: Colors.grey),
                  );
                }),
            const SizedBox(
              height: 30,
            ),
            customRoundedButton(
              text: 'Add card',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddCard(
                      phoneNumber: widget.phoneNumber,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}

class CreditCardDetails {
  int? pid;
  String? usercontactno;
  String? userhno;
  String? usercardno;
  String? usersecurecode;
  String? userexpirycode;

  CreditCardDetails(
      {this.pid,
      this.usercontactno,
      this.userhno,
      this.usercardno,
      this.usersecurecode,
      this.userexpirycode});

  CreditCardDetails.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    usercontactno = json['usercontactno'];
    userhno = json['userhno'];
    usercardno = json['usercardno'];
    usersecurecode = json['usersecurecode'];
    userexpirycode = json['userexpirycode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pid'] = pid;
    data['usercontactno'] = usercontactno;
    data['userhno'] = userhno;
    data['usercardno'] = usercardno;
    data['usersecurecode'] = usersecurecode;
    data['userexpirycode'] = userexpirycode;
    return data;
  }
}
