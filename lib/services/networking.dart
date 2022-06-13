
import 'dart:convert';

import 'package:http/http.dart' as http;

class Networking{

  Networking(this.url);

  final String url;

  Future getData() async{
    http.Response res = await http.get(Uri.parse(url));
    String data = res.body;
    return jsonDecode(data);
    
  }
}