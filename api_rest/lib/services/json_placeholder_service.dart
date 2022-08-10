import 'package:api_rest/models/todo_model.dart';
import 'package:api_rest/services/my_http_client.dart';
import 'package:dio/dio.dart';

const url = 'https://jsonplaceholder.typicode.com/todos';

class JsonPlaceholderService {
  final IHttpClient client;

  JsonPlaceholderService(this.client);

  Future<List<TodoModel>> getTodos() async {
    final body = await client.get(url);
    return (body as List).map(TodoModel.fromJson).toList();
  }
}