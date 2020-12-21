import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:petify/utils.dart/constant.dart';

Future<List<dynamic>> getNetwork(endpoint) async {
  String url = mainUrl + endpoint;

  var response = await http.get(url);

  final int statusCode = response.statusCode;
  print('entered get ${response.body}');
  final Map parsed = json.decode(response.body);
  if (statusCode < 200 || statusCode > 400 || json == null) {
    return [false, parsed];
  }

  return [true, parsed];
}

Future<List<dynamic>> postNetwork(String endpoint, Map _body) async {
  String url = mainUrl + endpoint;
  var body = json.encode(_body);
  print("the body is $body");
  print("the url is $url");
  var response = await http.post(url,
      headers: {"Content-Type": "application/json"}, body: body);
  final int statusCode = response.statusCode;
  print('entered post ${response.body}');
  final Map parsed = json.decode(response.body);
  print('json recieved $parsed');
  if (statusCode < 200 || statusCode > 400 || json == null) {
    return [false, parsed];
  }

  return [true, parsed];
}
