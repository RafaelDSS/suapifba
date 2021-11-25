// To parse this JSON data, do
//
//     final listVirtualClass = listVirtualClassFromJson(jsonString);

import 'dart:convert';

List<VirtualClassesModel> virtualClassesFromJson(List items) =>
    List<VirtualClassesModel>.from(
        items.map((x) => VirtualClassesModel.fromJson(x)));

String listVirtualClassToJson(List<VirtualClassesModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class VirtualClassesModel {
  String? id;
  String? sigla;
  String? descricao;
  dynamic observacao;
  List<String>? locaisDeAula;
  String? horariosDeAula;

  VirtualClassesModel({
    this.id,
    this.sigla,
    this.descricao,
    this.observacao,
    this.locaisDeAula,
    this.horariosDeAula,
  });

  factory VirtualClassesModel.fromJson(Map<String, dynamic> json) =>
      VirtualClassesModel(
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
        "locais_de_aula": List<dynamic>.from(locaisDeAula!.map((x) => x)),
        "horarios_de_aula": horariosDeAula,
      };
}
