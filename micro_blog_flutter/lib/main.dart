import 'package:flutter/material.dart';
import 'package:micro_blog_flutter/screens/splash/splash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
      },
    );
  }
}
