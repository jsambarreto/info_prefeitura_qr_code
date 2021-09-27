// To parse this JSON data, do
//
//     final UnidadeSaude = UnidadeSaudeFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

UnidadeSaude unidadeSaudeFromJson(String str) =>
    UnidadeSaude.fromJson(json.decode(str));

String unidadeSaudeToJson(UnidadeSaude data) => json.encode(data.toJson());

class UnidadeSaude {
  UnidadeSaude({
    required this.idEscola,
    required this.escolaResumido,
    required this.escolaCompleto,
    required this.diretor,
    required this.telefone,
    required this.latitude,
    required this.longitude,
    required this.endereco,
    required this.email,
    required this.servicos,
  });

  String idEscola;
  String escolaResumido;
  String escolaCompleto;
  String diretor;
  String telefone;
  String latitude;
  String longitude;
  String endereco;
  String email;
  List<Servico> servicos;

  factory UnidadeSaude.fromJson(Map<String, dynamic> json) => UnidadeSaude(
        idEscola: json["ID_ESCOLA"],
        escolaResumido: json["ESCOLA_RESUMIDO"],
        escolaCompleto: json["ESCOLA_COMPLETO"],
        diretor: json["DIRETOR"],
        telefone: json["TELEFONE"],
        latitude: json["LATITUDE"],
        longitude: json["LONGITUDE"],
        endereco: json["ENDERECO"],
        email: json["EMAIL"],
        servicos: List<Servico>.from(
            json["SERVICOS"].map((x) => Servico.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID_ESCOLA": idEscola,
        "ESCOLA_RESUMIDO": escolaResumido,
        "ESCOLA_COMPLETO": escolaCompleto,
        "DIRETOR": diretor,
        "TELEFONE": telefone,
        "LATITUDE": latitude,
        "LONGITUDE": longitude,
        "ENDERECO": endereco,
        "EMAIL": email,
        "SERVICOS": List<dynamic>.from(servicos.map((x) => x.toJson())),
      };
}

class Servico {
  Servico({
    required this.exame,
    required this.consulta,
  });

  String exame;
  String consulta;

  factory Servico.fromJson(Map<String, dynamic> json) => Servico(
        exame: json["exame"],
        consulta: json["consulta"],
      );

  Map<String, dynamic> toJson() => {
        "exame": exame,
        "consulta": consulta,
      };
}
