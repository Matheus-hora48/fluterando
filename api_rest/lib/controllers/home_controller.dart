import 'package:api_rest/models/todo_model.dart';
import 'package:api_rest/services/dio_client.dart';
import 'package:api_rest/services/json_placeholder_service.dart';
import 'package:flutter/cupertino.dart';

class HomeController extends ChangeNotifier{
  final JsonPlaceholderService _service;

  HomeController(this._service);

  var todos = <TodoModel>[];

  Future<void> fetchAllTodos() async{
    todos = await _service.getTodos();
    notifyListeners();
  }

}