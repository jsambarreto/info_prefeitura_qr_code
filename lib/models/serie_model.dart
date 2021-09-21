class SeriesEscola {
  final String serie;
  final String cursando;
  final String capacidade;
  final String vagas;

  SeriesEscola({
    required this.serie,
    required this.cursando,
    required this.capacidade,
    required this.vagas,
  });

  factory SeriesEscola.fromJson(Map<String, dynamic> parsedJson) {
    return SeriesEscola(
      serie: parsedJson['SERIE'],
      cursando: parsedJson['CURSANDO'].toString(),
      capacidade: parsedJson['CAPACIDADE'].toString(),
      vagas: parsedJson['VAGAS'].toString(),
    );
  }
}
