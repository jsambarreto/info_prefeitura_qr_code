import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  String? idSetor = '1000000006'; // Uri.base.queryParameters["id"];
  String? dsSecretaria =
      'escolas'; //  Uri.base.queryParameters["dsSecretaria"];

  runApp(HomePage(
    dsSecretaria: dsSecretaria,
    id: idSetor,
  ));
}
