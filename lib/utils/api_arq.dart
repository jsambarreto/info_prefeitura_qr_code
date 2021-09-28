import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:info_prefeitura_qr_code/models/saude_model.dart';

Future<String> _carregaArqJson() async {
  print(await rootBundle.loadString('/data/saudeJson_copy.json'));
  return await rootBundle.loadString('/data/saudeJson_copy.json');
}

Future<UnidadeSaude> carregaUnidade(
    {required String? id, required String? dsSecretaria}) async {
  String? idUne = id;
  String? dsSecret = dsSecretaria;
  var i;
  if (idUne == "1000000001") {
    i = 0;
  } else if (idUne == "1000000002") {
    i = 1;
  } else if (idUne == "1000000003") {
    i = 2;
  } else if (idUne == "1000000004") {
    i = 3;
  }
  String jsonString = await _carregaArqJson();
  //print(jsonString);
  final jsonResponse = json.decode(jsonString);
  //var i = UnidadeSaude.fromJson(jsonResponse).idEscola;
  return UnidadeSaude.fromJson(jsonResponse[i]);
}
