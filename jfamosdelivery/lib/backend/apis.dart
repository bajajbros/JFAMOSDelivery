import 'package:http/http.dart' as http;
import 'package:jfamosdelivery/backend/links.dart';

Future getData({String? api}) async {
  final response = await http.get(Uri.parse(api!));
  if (response.statusCode == 200) {
    var data = response.body;
    return data;
  } else {
    return response.statusCode;
  }
}

Future<Object> splashScreenData() async {
  var data = await getData(api: splashAPI);
  return data;
}

Future<Object> onBoardingData() async {
  var data = await getData(api: onBoardingAPI);
  return data;
}
