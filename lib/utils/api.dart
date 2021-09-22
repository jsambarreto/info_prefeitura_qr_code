import 'package:http/http.dart' as http;
import '../models/escola_model.dart';
import 'dart:async';
import 'dart:convert';

Future<String> _loadAEscolaAsset(
    {required String id_escola, required String dsSecretaria}) async {
  var headers = {'Access-Control-Allow-Origin': '*'};
  String? idEscola = id_escola;
  String? dsSc = dsSecretaria;
  final response = await http.get(
    Uri.parse('http://portal.wimaxi.com.br:20000/api/' + dsSc + '/' + idEscola),
    //Uri.parse('http://portal.wimaxi.com.br:20000/api/escolas/1000000006'),
    headers: headers,
  );
  return response.body;
}

Future<Escola> loadEscola(
    {required String id, required String dsSecretar}) async {
  String? idEscola = id;
  String? dsSecretaria = dsSecretar;
  await wait(5);
  String jsonString =
      await _loadAEscolaAsset(id_escola: idEscola, dsSecretaria: dsSecretaria);
  final jsonResponse = json.decode(jsonString);
  return Escola.fromJson(jsonResponse);
}

Future wait(int seconds) {
  return Future.delayed(Duration(seconds: seconds), () => {});
}
