import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:info_prefeitura_qr_code/models/saude_model.dart';

Future<String> _carregaArqJson() async {
  //print(await rootBundle.loadString('assets/data/saudeJson.json'));
  return await rootBundle.loadString('/data/saudeJson.json');
}

Future<UnidadeSaude> carregaUnidade() async {
  String jsonString = await _carregaArqJson();
  //print(jsonString);
  final jsonResponse = json.decode(jsonString);
  return UnidadeSaude.fromJson(jsonResponse);
}
