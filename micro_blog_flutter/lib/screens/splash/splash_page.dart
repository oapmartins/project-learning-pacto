import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:micro_blog_flutter/controllers/user/user_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 2)).then(
      (value) => {
        GetIt.I.get<UserController>().verifyExistsUser(
          existsUser: () {
            Navigator.pushReplacementNamed(context, '/homePage');
          },
          dontExistsUser: () {
            Navigator.pushReplacementNamed(context, '/loginPage');
          },
        )
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Carregando...',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
