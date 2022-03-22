import 'package:flutter/material.dart';
import 'package:jfamosdelivery/Screens/drawer/payment/addcard.dart';
import 'package:jfamosdelivery/helper/widgets.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
            const Spacer(),
            const Text(
              'No cards added',
              style: TextStyle(
                  fontSize: 20, fontFamily: 'fredoka', color: Colors.grey),
            ),
            const Spacer(),
            customRoundedButton(
                text: 'Add card',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AddCard()));
                }),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
