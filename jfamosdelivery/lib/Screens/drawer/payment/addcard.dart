import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:jfamosdelivery/Screens/drawer/payment/paymentscreen.dart';
import 'package:jfamosdelivery/backend/apis.dart';
import 'package:jfamosdelivery/helper/consts.dart';
import 'package:jfamosdelivery/helper/widgets.dart';
import 'package:month_year_picker/month_year_picker.dart';

class AddCard extends StatefulWidget {
  final String phoneNumber;
  const AddCard({Key? key, required this.phoneNumber}) : super(key: key);

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  showDataPicker() async {
    final selected = await showMonthYearPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime(2022),
    );
    return selected;
  }

  Future sendData() async {
    // String phoneNumber = widget.phoneNumber;
    String api =
        'http://www.jfamoslogistics.com/APIs/APIs2.asmx/InsertPayment?usercontactno=${widget.phoneNumber}&userhname=$cardHolderName&usercardno=$cardNumber&usersecurecode=$cvvCode&userexpirycode=$expiryDate';
    var response = await getData(api: api);
    // print(response);
    // print(
    //     'CardHolderName: $cardHolderName, cardNumber: $cardNumber, cvvCode: $cvvCode, expiryDate: $expiryDate, phoneNumber: $phoneNumber');
    return response;
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
        title: const Text('Add Card',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'fredoka',
                color: Colors.black)),
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            CreditCardWidget(
              // backgroundImage: 'assets/images/gradient.jpeg',
              textStyle: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'fredoka'),
              // glassmorphismConfig: Glassmorphism.defaultConfig(),
              cardNumber: cardNumber,
              expiryDate: expiryDate,
              cardHolderName: cardHolderName,
              cvvCode: cvvCode,
              showBackView: isCvvFocused,
              obscureCardNumber: true,
              obscureCardCvv: true,
              isHolderNameVisible: true,
              cardBgColor: kGreenColor,
              isSwipeGestureEnabled: true,
              onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    CreditCardForm(
                      formKey: formKey,
                      obscureCvv: true,
                      obscureNumber: true,
                      cardNumber: cardNumber,
                      cvvCode: cvvCode,
                      isHolderNameVisible: true,
                      isCardNumberVisible: true,
                      isExpiryDateVisible: true,
                      cardHolderName: cardHolderName,
                      expiryDate: expiryDate,
                      themeColor: kGreenColor,
                      textColor: Colors.black,
                      cardNumberDecoration: customInputDecoration(
                        hintText: 'Enter Card Number',
                        prefixIcon: const Icon(
                          Icons.credit_card,
                          color: kGreenColor,
                        ),
                      ),
                      expiryDateDecoration: customInputDecoration(
                        hintText: 'Expired Date',
                        prefixIcon: const Icon(
                          Icons.date_range,
                          color: kGreenColor,
                        ),
                      ),
                      cvvCodeDecoration: customInputDecoration(
                        hintText: 'Security Code',
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: kGreenColor,
                        ),
                      ),
                      cardHolderDecoration: customInputDecoration(
                        hintText: 'Enter Card holder Name',
                        prefixIcon: const Icon(
                          Icons.person,
                          color: kGreenColor,
                        ),
                      ),
                      onCreditCardModelChange: onCreditCardModelChange,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    customRoundedButton(
                      text: 'Add Card',
                      onPressed: () async {
                        await sendData();
                        setState(() {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PaymentScreen(
                                  phoneNumber: widget.phoneNumber),
                            ),
                          );
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
