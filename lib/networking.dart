import 'dart:convert';
import 'package:http/http.dart' as http;

class Networking {
  final String url;
  Networking({required this.url});
  Future getData() async {
    http.Response result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      var data = jsonDecode(result.body);
      return data['rate'];
    } else {
      print(result.statusCode);
      throw "could not fetch coin data";
    }
  }
}
