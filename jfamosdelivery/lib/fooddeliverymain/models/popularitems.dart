import 'dart:convert';

List<PopularItems> postFromJson(String str) => List<PopularItems>.from(
    json.decode(str).map((x) => PopularItems.fromMap(x)));

class PopularItems {
  int? pid;
  String? pimage;
  String? pName;

  PopularItems({required this.pid, required this.pimage, required this.pName});

  factory PopularItems.fromMap(Map<String, dynamic> json) => PopularItems(
        pid: json['pid'],
        pimage: json['pimage'],
        pName: json['pName'],
      );
}
