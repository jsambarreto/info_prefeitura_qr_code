import 'dart:io';

import 'package:http/http.dart' as http;
import '../models/escola_model.dart';
import 'dart:async';
import 'dart:convert';

Future<String> _loadAEscolaAsset(
    {required String id_escola, required String dsSecretaria}) async {
  final Map<String, String> mapHeaders = {
    "Accept": "application/json",
  };

  String? idEscola = id_escola;
  String? dsSc = dsSecretaria;
  final response = await http.get(
      Uri.parse('https://apuned.educacao.feira.br:20020/api/' +
          dsSc +
          '/' +
          idEscola),
      headers: mapHeaders);
  return response.body;
}

Future<Escola> loadEscola(
    {required String id, required String dsSecretar}) async {
  String? idEscola = id;
  String? dsSecretaria = dsSecretar;
  await wait(2);
  String jsonString =
      await _loadAEscolaAsset(id_escola: idEscola, dsSecretaria: dsSecretaria);
  final jsonResponse = json.decode(jsonString);
  return Escola.fromJson(jsonResponse);
}

Future wait(int seconds) {
  return Future.delayed(Duration(seconds: seconds), () => {});
}
