import 'dart:convert';

List<CartItems> postFromJson(String str) =>
    List<CartItems>.from(json.decode(str).map((x) => CartItems.fromMap(x)));

class CartItems {
  int? aid;
  String? itemname;
  String? itemprice;
  String? itemcount;
  String? usermob;
  String? restrauntname;

  CartItems(
      {required this.aid,
      required this.itemname,
      required this.itemprice,
      required this.itemcount,
      required this.usermob,
      required this.restrauntname});

  factory CartItems.fromMap(Map<String, dynamic> json) => CartItems(
      aid: json['aid'],
      itemname: json['itemname'],
      itemprice: json['itemprice'],
      itemcount: json['itemcount'],
      usermob: json['usermob'],
      restrauntname: json['restrauntname']);
}
