// To parse this JSON data, do
//
//     final listVirtualClass = listVirtualClassFromJson(jsonString);

import 'dart:convert';

import 'dart:typed_data';

List<ListVirtualClass> listVirtualClassFromJson(Uint8List str) =>
    List<ListVirtualClass>.from(
        json.decode(utf8.decode(str)).map((x) => ListVirtualClass.fromJson(x)));

String listVirtualClassToJson(List<ListVirtualClass> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListVirtualClass {
  String id;
  String sigla;
  String descricao;
  dynamic observacao;
  List<String> locaisDeAula;
  String horariosDeAula;

  ListVirtualClass({
    this.id,
    this.sigla,
    this.descricao,
    this.observacao,
    this.locaisDeAula,
    this.horariosDeAula,
  });

  factory ListVirtualClass.fromJson(Map<String, dynamic> json) =>
      ListVirtualClass(
        id: json["id"],
        sigla: json["sigla"],
        descricao: json["descricao"],
        observacao: json["observacao"],
        locaisDeAula: List<String>.from(json["locais_de_aula"].map((x) => x)),
        horariosDeAula: json["horarios_de_aula"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sigla": sigla,
        "descricao": descricao,
        "observacao": observacao,
        "locais_de_aula": List<dynamic>.from(locaisDeAula.map((x) => x)),
        "horarios_de_aula": horariosDeAula,
      };
}
