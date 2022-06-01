import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'apis.dart';
import 'models/restrauntmenu.dart';

class RestrauntPage extends StatefulWidget {
  final String restrauntId;
  final String restrauntName;
  final String restrauntType;
  final String restrauntApproxBill;
  final String restrauntTagline;

  const RestrauntPage(
      {Key? key,
      required this.restrauntId,
      required this.restrauntType,
      required this.restrauntApproxBill,
      required this.restrauntTagline,
      required this.restrauntName})
      : super(key: key);
  @override
  State<RestrauntPage> createState() => _RestrauntPageState();
}

class _RestrauntPageState extends State<RestrauntPage> {
  int _counterValue = 1;
  bool itemAdded = false;
  late Future<List<RestrauntMenu>> futureRestrauntMenu;
  Future<List<RestrauntMenu>> fetchRestrauntMenu() async {
    String restrauntId = widget.restrauntId;
    final response = await http.get(Uri.parse(menuApi(restrauntId)));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<RestrauntMenu>((json) => RestrauntMenu.fromMap(json))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  addToCartButton(
      {required String? itemname,
      required String? itemprice,
      required int? itemCount,
      required String? usermob,
      required String? restrauntName}) {
    return ElevatedButton(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(
          6,
        ),
        backgroundColor: MaterialStateProperty.all(Colors.white),
      ),
      onPressed: () {
        addToCart(
            itemname: itemname,
            itemprice: itemprice,
            restrauntName: restrauntName,
            usermob: usermob,
            itemCount: itemCount);
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'ADD TO CART',
          style: TextStyle(
            color: Colors.green,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  counterButton() {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: CounterButton(
        loading: false,
        onChange: (int val) {
          setState(() {
            _counterValue = val;
          });
        },
        count: _counterValue,
        countColor: Colors.green,
        buttonColor: Colors.black,
        progressColor: Colors.black,
      ),
    );
  }

  Future addToCart(
      {required String? itemname,
      required String? itemprice,
      required int? itemCount,
      required String? usermob,
      required String? restrauntName}) async {
    itemCount = _counterValue;
    var url = addToCartApi(
        itemname: itemname,
        itemprice: itemprice,
        itemCount: itemCount,
        usermob: usermob,
        restrauntName: restrauntName);
    var response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      setState(() {
        itemAdded = true;
      });
    } else {
      return false;
    }
  }

  @override
  void initState() {
    futureRestrauntMenu = fetchRestrauntMenu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Restraunt Name'),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.restrauntName,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      // const SizedBox(height: 4),
                      Text(
                        widget.restrauntType,
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Text(
                        widget.restrauntTagline,
                        style: const TextStyle(
                          color: Colors.black87,
                          fontSize: 12,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                const WidgetSpan(
                                  child: Icon(
                                    Icons.currency_rupee,
                                    size: 16,
                                    color: Color.fromARGB(255, 45, 174, 49),
                                  ),
                                ),
                                TextSpan(
                                  text: widget.restrauntApproxBill,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 49, 171, 53),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '3.6',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.03,
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: FutureBuilder<List<RestrauntMenu>>(
                  future: futureRestrauntMenu,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ExpansionTile(
                            initiallyExpanded: true,
                            childrenPadding: const EdgeInsets.all(8),
                            title: Text(
                              snapshot.data![index].catname!,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            children: [
                              Row(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data![index].itemname!,
                                        style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        snapshot.data![index].itemPrice!,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        snapshot.data![index].itemDescription!,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Stack(
                                    alignment: Alignment.bottomCenter,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 16),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: FittedBox(
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.22,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.4,
                                              decoration: BoxDecoration(
                                                color: Colors.red,
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: NetworkImage(
                                                    'http://www.jfamoslogistics.com/images/${snapshot.data![index].itemimage!}',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment.topRight,
                                          child: itemAdded
                                              ? counterButton()
                                              : addToCartButton(
                                                  itemprice: snapshot
                                                      .data![index].itemPrice,
                                                  itemname: snapshot
                                                      .data![index].itemname,
                                                  itemCount: _counterValue,
                                                  restrauntName:
                                                      widget.restrauntName,
                                                  usermob: '9354954343',
                                                ))
                                    ],
                                  )
                                ],
                              ),
                            ],
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
