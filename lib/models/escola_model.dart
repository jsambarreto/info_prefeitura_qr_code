// To parse this JSON data, do
//
//     final escola = escolaFromJson(jsonString);

import 'dart:convert';

Escola escolaFromJson(String str) => Escola.fromJson(json.decode(str));

String escolaToJson(Escola data) => json.encode(data.toJson());

class Escola {
  Escola({
    required this.idEscola,
    required this.escolaResumido,
    required this.escolaCompleto,
    required this.diretor,
    required this.telefone,
    required this.latitude,
    required this.longitude,
    required this.endereco,
    required this.email,
    required this.series,
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
  List<Series> series;

  factory Escola.fromJson(Map<String, dynamic> json) => Escola(
        idEscola: json["ID_ESCOLA"],
        escolaResumido: json["ESCOLA_RESUMIDO"],
        escolaCompleto: json["ESCOLA_COMPLETO"],
        diretor: json["DIRETOR"],
        telefone: json["TELEFONE"],
        latitude: json["LATITUDE"],
        longitude: json["LONGITUDE"],
        endereco: json["ENDERECO"],
        email: json["EMAIL"],
        series:
            List<Series>.from(json["SERIES"].map((x) => Series.fromJson(x))),
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
        "SERIES": List<dynamic>.from(series.map((x) => x.toJson())),
      };
}

class Series {
  Series({
    required this.serie,
    required this.cursando,
    required this.capacidade,
    required this.vagas,
  });

  String serie;
  String cursando;
  String capacidade;
  String vagas;

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        serie: json["serie"],
        cursando: json["cursando"],
        capacidade: json["capacidade"],
        vagas: json["vagas"],
      );

  Map<String, dynamic> toJson() => {
        "serie": serie,
        "cursando": cursando,
        "capacidade": capacidade,
        "vagas": vagas,
      };
}
