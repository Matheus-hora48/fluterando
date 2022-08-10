import 'package:api_rest/services/my_http_client.dart';
import 'package:dio/dio.dart';

class DioClient implements IHttpClient{
  final dio = Dio();

  @override
  Future<dynamic> get(String url) async {
    final response = await dio.get(url);
    return response.data;
  }
}