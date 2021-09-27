import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  String? id = Uri.base.queryParameters["id"];
  String? dsSecretaria = Uri.base.queryParameters["dsSecretaria"];
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}

class Splash extends StatelessWidget {
  final String? id = Uri.base.queryParameters["id"];
  final String? dsSecretaria = Uri.base.queryParameters["dsSecretaria"];
  Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/banner_splash.jpg'),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                dsSecretaria: dsSecretaria,
                id: id,
              ),
            ),
          );
        },
        child: const Icon(Icons.home),
      ),
    );
  }
}
