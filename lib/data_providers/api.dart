import 'dart:convert';
import 'package:finam_flutter/models/model.dart';
import 'package:http/http.dart' as http;


class ApiDataProvider {
  Future<Model> getCurrentData() async {
    var url = Uri.parse(
        "https://www.reddit.com/r/flutterdev/new.json");
    var response = await http.get(url);
    var body = jsonDecode(response.body);
    return Model.fromJSON(body);
  }
}