import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  String? id = Uri.base.queryParameters["id"];
  String? dsSecretaria = Uri.base.queryParameters["dsSecretaria"];

  runApp(HomePage(
    dsSecretaria: dsSecretaria,
    id: id,
  ));
}
