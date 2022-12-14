import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_start/src/module/auth/auth_page.dart';
import 'package:provider_start/src/module/auth/controller/auth_controller.dart';
import 'package:provider_start/src/module/home/home_page.dart';
import 'package:provider_start/src/module/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthController())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (_) => const SplashPage(),
          '/auth': (_) => const AuthPage(),
          '/home': (_) => const HomePage(),
        },
      ),
    );
  }
}
