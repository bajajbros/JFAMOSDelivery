import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jfamosdelivery/fooddeliverymain/searchscreen.dart';

import 'package:shimmer/shimmer.dart';
import 'cart.dart';

import 'package:http/http.dart' as http;

import 'main.dart';
import 'models/popularitems.dart';
import 'models/restrauntclass.dart';
import 'restrauntpage.dart';

class FoodHomePage extends StatefulWidget {
  const FoodHomePage({Key? key}) : super(key: key);

  @override
  State<FoodHomePage> createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  late Future<List<Restraunt>> futureRestraunt;
  late Future<List<PopularItems>> futurePopularItems;
  Future<List<Restraunt>> fetchRestraunts() async {
    final response = await http.get(
        Uri.parse('http://www.jfamoslogistics.com/APIs/APIs2.asmx/Restraunts'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed.map<Restraunt>((json) => Restraunt.fromMap(json)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  Future<List<PopularItems>> fetchPopularItems() async {
    final response = await http.get(Uri.parse(
        'http://www.jfamoslogistics.com/APIs/APIs2.asmx/PopularFoods'));

    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

      return parsed
          .map<PopularItems>((json) => PopularItems.fromMap(json))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    futureRestraunt = fetchRestraunts();
    futurePopularItems = fetchPopularItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'What would you like to eat?',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          // height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ),
                    );
                  },
                  decoration: InputDecoration(
                    hintText: 'Find a food or restraunt',
                    hintStyle: const TextStyle(fontSize: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    contentPadding: const EdgeInsets.all(20),
                    prefixIcon: const Padding(
                      padding: EdgeInsets.only(left: 24.0, right: 16.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.black,
                        size: 28,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.25,
                  child: CarouselSlider(
                    options:
                        CarouselOptions(height: 400.0, enlargeCenterPage: true),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/images/carousel.png'),
                                  fit: BoxFit.fill,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                          );
                        },
                      );
                    }).toList(),
                  )),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        const Expanded(
                          child: Text(
                            'Trending items',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Spacer(),
                        IconButton(
                          icon: const Icon(Icons.arrow_right_alt,
                              color: Colors.black),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MyHomePage()));
                          },
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                    // FutureBuilder<List<PopularItems>>(
                    //   future: futurePopularItems,
                    //   builder: (context, snapshot) {
                    //     if (snapshot.hasData) {
                    //       return Expanded(
                    //         child: ListView.builder(
                    //             itemBuilder: ((context, index) {
                    //           return renderGridItem(
                    //               item: snapshot.data![index],
                    //               context: context);
                    //         })),
                    //       );
                    //     } else if (snapshot.hasError) {
                    //       return Text("${snapshot.error}");
                    //     }
                    //     return Shimmer(
                    //         gradient: LinearGradient(
                    //             colors: [Colors.grey[300]!, Colors.grey[100]!]),
                    //         child: Container());
                    //   },
                    // ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: const Center(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Image(
                      image: AssetImage(
                        'assets/images/Banner.png',
                      ),
                      fit: BoxFit.fitWidth,
                      // fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              FutureBuilder<List<Restraunt>>(
                future: futureRestraunt,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) => Padding(
                        padding: const EdgeInsets.all(12),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RestrauntPage(
                                  restrauntType:
                                      snapshot.data![index].restrauntType!,
                                  restrauntTagline:
                                      snapshot.data![index].restrauntTagline!,
                                  restrauntApproxBill: snapshot
                                      .data![index].restrauntApproxBill!,
                                  restrauntName:
                                      snapshot.data![index].restrauntname!,
                                  restrauntId:
                                      snapshot.data![index].restrauntid!,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.3,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromARGB(212, 164, 164, 164),
                                    blurRadius: 2,
                                    spreadRadius: 1),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadiusDirectional.all(
                                  Radius.circular(20)),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.22,
                                  width: double.infinity,
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    child: Image.asset(
                                      'assets/images/restraunt.png',
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.03,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          snapshot.data![index].restrauntname!,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w900,
                                          ),
                                        ),
                                        // const SizedBox(height: 4),
                                        Text(
                                          snapshot.data![index].restrauntType!,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),

                                        Text(
                                          snapshot.data![index]
                                              .restrauntApproxBill!,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontSize: 8,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            255, 49, 171, 53),
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
                                      width: MediaQuery.of(context).size.width *
                                          0.03,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      itemCount: snapshot.data!.length,
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return Shimmer(
                    gradient: LinearGradient(
                      colors: [Colors.white, Colors.grey[200]!],
                    ),
                    child: Container(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Badge(
        badgeColor: Colors.green,
        badgeContent: const Text(
          '3',
          style: TextStyle(color: Colors.white),
        ),
        child: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: ((context) => const Cart()),
              ),
            );
          },
          child: const Icon(Icons.shopping_cart, color: Colors.green),
        ),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
    );
  }
}
