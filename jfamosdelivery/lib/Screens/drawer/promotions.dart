import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Promotions extends StatefulWidget {
  const Promotions({Key? key}) : super(key: key);

  @override
  State<Promotions> createState() => _PromotionsState();
}

class _PromotionsState extends State<Promotions> {
  Future<List<CouponsList>>? futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Promo Codes',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 20,
                fontFamily: 'fredoka')),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Available Coupons',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  fontFamily: 'fredoka'),
            ),
          ),
          FutureBuilder<List<CouponsList>>(
              future: futureData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<CouponsList> data = snapshot.data!;
                  return Expanded(
                    child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: Card(
                              color: Colors.white,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 8, 0),
                                    child: Text(
                                      data[index].cdes!,
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: 'fredoka',
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 0, 8, 0),
                                    child: Text(
                                      data[index].cname!,
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'fredoka',
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 8, 8, 8),
                                    child: Text(
                                      'Valid till ${data[index].cvalidity!}',
                                      style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'fredoka',
                                        color: Colors.black38,
                                      ),
                                    ),
                                  ),
                                  const Divider(),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      color: Colors.grey[200],
                                      child: Text(
                                        data[index].ccode!,
                                        style: const TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'fredoka',
                                            color: Colors.black,
                                            letterSpacing: 15),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return const CircularProgressIndicator();
              })
        ],
      ),
    );
  }
}

class CouponsList {
  int? cid;
  String? cname;
  String? cdes;
  String? ccode;
  String? cvalidity;
  String? cpercentage;
  String? cmaxvalue;
  String? camountset;

  CouponsList(
      {this.cid,
      this.cname,
      this.cdes,
      this.ccode,
      this.cvalidity,
      this.cpercentage,
      this.cmaxvalue,
      this.camountset});

  CouponsList.fromJson(Map<String, dynamic> json) {
    cid = json['cid'];
    cname = json['cname'];
    cdes = json['cdes'];
    ccode = json['ccode'];
    cvalidity = json['cvalidity'];
    cpercentage = json['cpercentage'];
    cmaxvalue = json['cmaxvalue'];
    camountset = json['camountset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['cid'] = cid;
    data['cname'] = cname;
    data['cdes'] = cdes;
    data['ccode'] = ccode;
    data['cvalidity'] = cvalidity;
    data['cpercentage'] = cpercentage;
    data['cmaxvalue'] = cmaxvalue;
    data['camountset'] = camountset;
    return data;
  }
}

Future<List<CouponsList>> fetchData() async {
  Uri api = Uri.parse(
      'http://www.jfamoslogistics.com/APIs/APIs2.asmx/DisplayCoupons');
  final response = await http.get(api);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => CouponsList.fromJson(data)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}
