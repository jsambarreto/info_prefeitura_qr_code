import 'package:http/http.dart' as http;
import '../models/escola_model.dart';
import 'dart:async';
import 'dart:convert';

Future<String> _loadAEscolaAsset() async {
  final response = await http.get(
    Uri.parse('http://portal.wimaxi.com.br:20000/api/escolas/1000000002'),
  );
  return response.body;
}

Future<Escola> loadEscola() async {
  await wait(5);
  String jsonString = await _loadAEscolaAsset();
  final jsonResponse = json.decode(jsonString);
  return Escola.fromJson(jsonResponse);
}

Future wait(int seconds) {
  return Future.delayed(Duration(seconds: seconds), () => {});
}
