import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

import 'package:uno/uno.dart';

var url = 'https://jsonplaceholder.typicode.com/todos';

void main() async {
  final uno = Uno();
  final response = await uno(url: url, method: 'get', );
  print(response.data[3]);
}

Future<void> dioPackage() async {
  final response = await Dio().get(url);
  print(response.data[0]);
}

Future<void> httpPackage() async {
  final response = await http.get(Uri.parse(url));
  print(response.body);
}