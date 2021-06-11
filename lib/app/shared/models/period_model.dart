// To parse this JSON data, do
//
//     final period = periodFromJson(jsonString);

import 'dart:convert';

List<Period> periodFromJson(String str) =>
    List<Period>.from(json.decode(str).map((x) => Period.fromJson(x)));

String periodToJson(List<Period> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Period {
  int anoLetivo;
  int periodoLetivo;

  Period({
    this.anoLetivo,
    this.periodoLetivo,
  });

  factory Period.fromJson(Map<String, dynamic> json) => Period(
        anoLetivo: json["ano_letivo"],
        periodoLetivo: json["periodo_letivo"],
      );

  Map<String, dynamic> toJson() => {
        "ano_letivo": anoLetivo,
        "periodo_letivo": periodoLetivo,
      };
}
