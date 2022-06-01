import 'dart:convert';

List<Restraunt> postFromJson(String str) =>
    List<Restraunt>.from(json.decode(str).map((x) => Restraunt.fromMap(x)));

class Restraunt {
  Restraunt({
    required this.rid,
    required this.restrauntid,
    required this.restrauntname,
    required this.restrauntAddress,
    required this.restrauntContactNumber,
    required this.restrauntType,
    required this.restrauntApproxBill,
    required this.restrauntImage,
    required this.restrauntTagline,
  });

  int? rid;
  String? restrauntid;
  String? restrauntname;
  String? restrauntAddress;
  String? restrauntContactNumber;
  String? restrauntType;
  String? restrauntApproxBill;
  String? restrauntImage;
  String? restrauntTagline;

  factory Restraunt.fromMap(Map<String, dynamic> json) => Restraunt(
        rid: json['rid'],
        restrauntid: json['Restrauntid'],
        restrauntname: json['Restrauntname'],
        restrauntAddress: json['RestrauntAddress'],
        restrauntContactNumber: json['RestrauntContactNumber'],
        restrauntType: json['RestrauntType'],
        restrauntApproxBill: json['RestrauntApproxBill'],
        restrauntImage: json['RestrauntImage'],
        restrauntTagline: json['RestrauntTagline'],
      );
}
