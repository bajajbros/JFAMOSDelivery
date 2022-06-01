import 'dart:convert';

List<RestrauntMenu> postFromJson(String str) => List<RestrauntMenu>.from(
    json.decode(str).map((x) => RestrauntMenu.fromMap(x)));

class RestrauntMenu {
  int? rMid;
  String? itemname;
  String? itemPrice;
  String? itemDescription;
  String? itemimage;
  String? itemTag;
  String? catname;
  int? rid;

  RestrauntMenu(
      {this.rMid,
      this.itemname,
      this.itemPrice,
      this.itemDescription,
      this.itemimage,
      this.itemTag,
      this.catname,
      this.rid});

  factory RestrauntMenu.fromMap(Map<String, dynamic> json) => RestrauntMenu(
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

// // class PostsModel {
// //   PostsModel({
// //     int? userId,
// //     int? id,
// //     String? title,
// //     String? body,
// //   }) {
// //     _userId = userId;
// //     _id = id;
// //     _title = title;
// //     _body = body;
// //   }

// //   PostsModel.fromJson(dynamic json) {
// //     _userId = json['userId'];
// //     _id = json['id'];
// //     _title = json['title'];
// //     _body = json['body'];
// //   }
// //   int? _userId;
// //   int? _id;
// //   String? _title;
// //   String? _body;

// //   int? get userId => _userId;
// //   int? get id => _id;
// //   String? get title => _title;
// //   String? get body => _body;

// //   Map<String, dynamic> toJson() {
// //     final map = <String, dynamic>{};
// //     map['userId'] = _userId;
// //     map['id'] = _id;
// //     map['title'] = _title;
// //     map['body'] = _body;
// //     return map;
// //   }
// // }

// class PostsModel {
//   PostsModel({
//     int? rMid,
//     String? itemname,
//     String? itemPrice,
//     String? itemDescription,
//     String? itemimage,
//     String? itemTag,
//     String? catname,
//     int? rid,
//   }) {
//     _rMid = rMid;
//     _itemname = itemname;
//     _itemPrice = itemPrice;
//     _itemDescription = itemDescription;
//     _itemimage = itemimage;
//     _itemTag = itemTag;
//     _catname = catname;
//     _rid = rid;
//   }

//   PostsModel.fromJson(dynamic json) {
//     _rMid = json['rMid'];
//     _itemname = json['itemname'];
//     _itemPrice = json['itemPrice'];
//     _itemDescription = json['itemDescription'];
//     _itemimage = json['itemimage'];
//     _itemTag = json['itemTag'];
//     _catname = json['catname'];
//     _rid = json['rid'];
//   }
//   int? _rMid;
//   String? _itemname;
//   String? _itemPrice;
//   String? _itemDescription;
//   String? _itemimage;
//   String? _itemTag;
//   String? _catname;
//   int? _rid;

//   // int? get userId => _userId;
//   // int? get id => _id;
//   // String? get title => _title;
//   // String? get body => _body;
//   int? get rMid => _rMid;
//   String? get itemname => _itemname;
//   String? get itemPrice => _itemPrice;
//   String? get itemDescription => _itemDescription;
//   String? get itemimage => _itemimage;
//   String? get itemTag => _itemTag;
//   String? get catname => _catname;
//   int? get rid => _rid;

//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['rMid'] = _rMid;
//     map['itemname'] = _itemname;
//     map['itemPrice'] = _itemPrice;
//     map['itemDescription'] = _itemDescription;
//     map['itemimage'] = _itemimage;
//     map['itemTag'] = _itemTag;
//     map['catname'] = _catname;
//     map['rid'] = _rid;
//     return map;
//   }
// }
