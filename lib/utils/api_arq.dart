import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:info_prefeitura_qr_code/models/saude_model.dart';

//Future<String> _carregaArqJson() async {
//print(await rootBundle.loadString('/data/saudeJson_copy.json'));
//return await rootBundle.loadString('assets/assets/data/saudeJson_copy.json');
//}

var listaUnidade = '''
[
  {
    "ID_ESCOLA": "1000000001",
    "ESCOLA_RESUMIDO": "POLICLÍNICA OSVALDO MONTEIRO PIRAJA – TOMBA",
    "ESCOLA_COMPLETO": "POLICLÍNICA OSVALDO MONTEIRO PIRAJA – TOMBA",
    "DIRETOR": "SR. JOSÉ PIRES LEAL",
    "TELEFONE": "36124532; 36124531",
    "LATITUDE": "-12.258490",
    "LONGITUDE": "-38.946760",
    "ENDERECO": "RUA DO MÉXICO - TOMBA",
    "EMAIL": "policlinicatomba@gmail.com",
    "SERVICOS": [
      {"exame": "Raio-x", "consulta": "cardiologia", "vacinas": "Pfizer"}
    ]
  },
  {
    "ID_ESCOLA": "1000000002",
    "ESCOLA_RESUMIDO": "POLICLÍNICA EMILIA FREITAS CRUZ – PARQUE IPÊ",
    "ESCOLA_COMPLETO": "POLICLÍNICA EMILIA FREITAS CRUZ – PARQUE IPÊ",
    "DIRETOR": "SRª. PATRÍCIA LIMA SANTANA",
    "TELEFONE": "32243677;32243602",
    "LATITUDE": "-12.258490",
    "LONGITUDE": "-38.946760",
    "ENDERECO": "RODOLFO VALENTIM Nº 126-PARQUE IPÊ",
    "EMAIL": "policlinicaparqueipe@gmail.com",
    "SERVICOS": [
      {
        "exame": "Raio-x",
        "exame2": "Hemograma",
        "consulta": "cardiologia",
        "consulta2": "clinico geral"
      }
    ]
  },
  {
    "ID_ESCOLA": "1000000003",
    "ESCOLA_RESUMIDO": "POLICLINICA FRANCISCO MARTINS DA SILVA – RUA NOVA",
    "ESCOLA_COMPLETO": "POLICLINICA FRANCISCO MARTINS DA SILVA – RUA NOVA",
    "DIRETOR": "SRª. ANTÔNIO LOPES DE OLIVEIRA",
    "TELEFONE": "36027205;36027206",
    "LATITUDE": "-12.258490",
    "LONGITUDE": "-38.946760",
    "ENDERECO": "RUA CORDEIRO S/N – RUA NOVA",
    "EMAIL": "policlinicaruanova@gmail.com",
    "SERVICOS": [
      {
        "exame": "Hemograma",
        "consulta": "clinico geral",
        "consulta2": "pneumologista"
      }
    ]
  },
  {
    "ID_ESCOLA": "1000000004",
    "ESCOLA_RESUMIDO": "POLICLÍNICA JOÃO DURVAL CARNEIRO – FEIRA X",
    "ESCOLA_COMPLETO": "POLICLÍNICA JOÃO DURVAL CARNEIRO – FEIRA X",
    "DIRETOR": "MARCELA CAMPOS",
    "TELEFONE": "36037798;36239339;",
    "LATITUDE": "-12.258490",
    "LONGITUDE": "-38.946760",
    "ENDERECO": "RUA A S/N-CONJUNTO FEIRA X",
    "EMAIL": "policlinicafeirax@gmail.com",
    "SERVICOS": [
      {"exame": "Raio-x", "consulta": "cardiologia"}
    ]
  }
]
''';

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
  String jsonString = listaUnidade; //await _carregaArqJson();
  //print(jsonString);
  final jsonResponse = json.decode(jsonString);
  //print(jsonResponse[i]);
  return UnidadeSaude.fromJson(jsonResponse[i]);
}
