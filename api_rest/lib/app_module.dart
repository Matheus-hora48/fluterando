import 'package:api_rest/controllers/home_controller.dart';
import 'package:api_rest/services/dio_client.dart';
import 'package:api_rest/services/json_placeholder_service.dart';
import 'package:api_rest/services/my_http_client.dart';
import 'package:api_rest/views/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {



  @override
  List<Bind> get binds => [
    Bind.singleton<IHttpClient>((i) => DioClient()),
    Bind.singleton((i) => JsonPlaceholderService(i())),
    Bind.singleton((i) => HomeController(i())),
  ];

  @override
  List<ModularRoute> get routes => [
    ChildRoute('/', child: (_,__) => HomePage())
  ];
}