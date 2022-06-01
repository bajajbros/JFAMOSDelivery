import 'dart:convert';

List<SearchMenuItems> postFromJson(String str) => List<SearchMenuItems>.from(
    json.decode(str).map((x) => SearchMenuItems.fromMap(x)));

class SearchMenuItems {
  int? rMid;
  String? itemname;
  String? itemPrice;
  String? itemDescription;
  String? itemimage;
  String? itemTag;
  String? catname;
  int? rid;

  SearchMenuItems(
      {this.rMid,
      this.itemname,
      this.itemPrice,
      this.itemDescription,
      this.itemimage,
      this.itemTag,
      this.catname,
      this.rid});

  factory SearchMenuItems.fromMap(Map<String, dynamic> json) => SearchMenuItems(
        rid: json['rid'],
        rMid: json['RMid'],
        itemname: json['Itemname'],
        itemPrice: json['ItemPrice'],
        itemDescription: json['ItemDescription'],
        itemimage: json['Itemimage'],
        itemTag: json['ItemTag'],
        catname: json['Catname'],
      );
}
