import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:micro_blog_flutter/controllers/feed/feed_controller.dart';
import 'package:micro_blog_flutter/screens/home/home_page.dart';
import 'package:micro_blog_flutter/screens/login/login_page.dart';
import 'package:micro_blog_flutter/screens/register/register_page.dart';
import 'package:micro_blog_flutter/screens/splash/splash_page.dart';

import 'package:micro_blog_flutter/controllers/user/user_controller.dart';
import 'services/services_micro_blog.dart';

final getIt = GetIt.instance;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton(ServicesMicroBlog(Dio()));
  getIt.registerSingleton(UserController());
  getIt.registerSingleton(FeedController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/splashPage',
      routes: {
        '/splashPage': (_) => SplashPage(),
        '/loginPage': (_) => LoginPage(),
        '/homePage': (_) => HomePage(),
        '/registerPage': (_) => RegisterPage(),
      },
    );
  }
}
