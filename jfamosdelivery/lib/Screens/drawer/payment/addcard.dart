import 'package:flutter/material.dart';
import 'package:jfamosdelivery/helper/consts.dart';
import 'package:jfamosdelivery/helper/widgets.dart';

class AddCard extends StatefulWidget {
  const AddCard({Key? key}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const BackButton(color: Colors.black),
          title: const Text(
            'Add Card',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                fontFamily: 'fredoka',
                color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                AppBar().preferredSize.height -
                MediaQuery.of(context).padding.top,
            child: Column(
              children: [
                customTextField(
                  keyboardType: TextInputType.number,
                  hintText: 'Card number',
                  prefixIcon: const Icon(
                    Icons.credit_card,
                    color: kGreenColor,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: customTextField(
                        leftPadding: 30,
                        rightPadding: 16,
                        keyboardType: TextInputType.number,
                        hintText: 'Secure code',
                        prefixIcon: const Icon(
                          Icons.security,
                          color: kGreenColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: customTextField(
                        leftPadding: 16,
                        rightPadding: 30,
                        keyboardType: TextInputType.datetime,
                        hintText: 'Expiry date',
                        prefixIcon: const Icon(
                          Icons.calendar_today,
                          color: kGreenColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                customRoundedButton(text: 'Add card', onPressed: () {}),
                const SizedBox(
                  height: 40,
                )
              ],
            ),
          ),
        ));
  }
}
