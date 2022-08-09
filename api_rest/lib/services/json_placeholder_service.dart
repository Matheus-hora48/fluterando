import 'package:api_rest/models/todo_model.dart';
import 'package:dio/dio.dart';

const url = 'https://jsonplaceholder.typicode.com/todos';

class JsonPlaceholderService {
  final Dio dio;

  JsonPlaceholderService(this.dio);

  Future<List<TodoModel>> getTodos() async {
    final response = await dio.get(url);
    final body = response.data as List;
    return body.map(TodoModel.fromJson).toList();
  }
}