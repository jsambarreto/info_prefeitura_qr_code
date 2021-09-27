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
        child: Image.network(
            'https://instagram.fssa13-1.fna.fbcdn.net/v/t51.2885-15/e35/s1080x1080/240578303_525229025435740_7854877106617444171_n.jpg?_nc_ht=instagram.fssa13-1.fna.fbcdn.net&_nc_cat=104&_nc_ohc=0Rol6yRpjlYAX9bEvJa&edm=AP_V10EBAAAA&ccb=7-4&oh=637b99fb7a73aafbc0aaf135701b06c7&oe=6157C952&_nc_sid=4f375e'),
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
