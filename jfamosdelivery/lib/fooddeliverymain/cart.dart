import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'models/cartitems.dart';

class Cart extends StatefulWidget {
  static int? cartSize;
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late Future<List<CartItems>> futureCartItems;
  Future<List<CartItems>> fetchCartItems() async {
    final response = await http.get(Uri.parse(
        'http://www.jfamoslogistics.com/APIs/APIs2.asmx/DisplayCart?usermob=9354954343'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<CartItems>((json) => CartItems.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future deleteCart() async {
    var url =
        'http://www.jfamoslogistics.com/APIs/APIs2.asmx/DeleteCart?usermob=9354954343';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return true;
    } else {
      return log('Failed to delete cart');
    }
  }

  Future alertBox() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete All Cart Items'),
          content:
              const Text('Are you sure you want to delete all cart items?'),
          actions: [
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  foregroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel')),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () async {
                await deleteCart();

                setState(
                  () {
                    futureCartItems = fetchCartItems();
                    Navigator.pop(context);
                  },
                );
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text('Yes'),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    futureCartItems = fetchCartItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                alertBox();
              });
            },
            icon: const Icon(Icons.delete),
          )
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          'Burger Singh',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ),
      body: FutureBuilder<List<CartItems>>(
        future: futureCartItems,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Cart.cartSize = snapshot.data!.length;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Your order',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: false,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(
                              Icons.fastfood,
                              color: Colors.green,
                            ),
                            trailing: Text(
                              'No of items: ${snapshot.data![index].itemcount}',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              snapshot.data![index].itemprice!,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            title: Text(
                              snapshot.data![index].itemname!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                //  const SizedBox(
                //   height: 16.0,
                // ),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Row(
                //       children: const [
                //         Text('Items total'),
                //         Spacer(),
                //         Text(''),
                //       ],
                //     ),
                //     Row(
                //       children: const [
                //         Text('Delivery fee'),
                //         Spacer(),
                //         Text(''),
                //       ],
                //     ),
                //     Row(
                //       children: const [
                //         Text('Taxes and charges'),
                //         Spacer(),
                //         Text(''),
                //       ],
                //     ),
                //     const Divider(
                //       height: 1,
                //     ),
                //     Row(
                //       children: const [
                //         Text(
                //           'To pay',
                //           style: TextStyle(
                //             fontSize: 20,
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         Spacer(),
                //         Text(
                //           '',
                //           style: TextStyle(
                //               fontSize: 12, fontWeight: FontWeight.bold),
                //         ),
                //       ],
                //     ),

                //   ],
                Container(
                    alignment: Alignment.bottomCenter,
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      boxShadow: [BoxShadow(blurRadius: 10)],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: const [
                                Text(
                                  'Items total',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '\$999',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Delivery fee',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '\$99',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: const [
                                Text(
                                  'Taxes and charges',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '\$99',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(
                              height: 1,
                            ),
                            Row(
                              children: const [
                                Text(
                                  'To pay',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '\$999',
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            const Spacer(),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                  Colors.green,
                                ),
                                foregroundColor: MaterialStateProperty.all(
                                  Colors.white,
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: const [
                                  Spacer(),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 12),
                                    child: Text(
                                      'Proceed to Pay',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                            ),
                          ]),
                    ))
              ],
            );
          }
          return Shimmer(
            gradient:
                LinearGradient(colors: [Colors.grey[300]!, Colors.grey[100]!]),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
            ),
          );
        },
      ),
    );
  }
}
