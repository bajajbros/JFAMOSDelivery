String menuApi(String restrauntId) {
  return 'http://www.jfamoslogistics.com/APIs/APIs2.asmx/RestrauntMenu?id=$restrauntId';
}

String addToCartApi({
  required String? itemname,
  required String? itemprice,
  required int? itemCount,
  required String? usermob,
  required String? restrauntName,
}) {
  return 'http://www.jfamoslogistics.com/APIs/APIs2.asmx/AddToCart?itemname=$itemname&itemprice=$itemprice&itemcount=$itemCount&usermob=$usermob&restrauntname=$restrauntName';
}
