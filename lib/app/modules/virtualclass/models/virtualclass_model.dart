// To parse this JSON data, do
//
//     final virtualClass = virtualClassFromJson(jsonString);

import 'dart:convert';
import 'dart:typed_data';

import 'package:intl/intl.dart';

final formatter = DateFormat('dd/MM/yyyy');

VirtualClass virtualClassFromJson(Uint8List str) =>
    VirtualClass.fromJson(json.decode(utf8.decode(str)));

String virtualClassToJson(VirtualClass data) => json.encode(data.toJson());

class VirtualClass {
  int id;
  String anoLetivo;
  int periodoLetivo;
  String componenteCurricular;
  List<Participante> professores;
  List<dynamic> locaisDeAula;
  DateTime dataInicio;
  DateTime dataFim;
  List<Participante> participantes;
  List<Aula> aulas;
  List<MateriaisDeAula> materiaisDeAula;

  VirtualClass({
    this.id,
    this.anoLetivo,
    this.periodoLetivo,
    this.componenteCurricular,
    this.professores,
    this.locaisDeAula,
    this.dataInicio,
    this.dataFim,
    this.participantes,
    this.aulas,
    this.materiaisDeAula,
  });

  factory VirtualClass.fromJson(Map<String, dynamic> json) => VirtualClass(
        id: json["id"],
        anoLetivo: json["ano_letivo"],
        periodoLetivo: json["periodo_letivo"],
        componenteCurricular: json["componente_curricular"],
        professores: List<Participante>.from(
            json["professores"].map((x) => Participante.fromJson(x))),
        locaisDeAula: List<dynamic>.from(json["locais_de_aula"].map((x) => x)),
        dataInicio: DateTime.parse(json["data_inicio"]),
        dataFim: DateTime.parse(json["data_fim"]),
        participantes: List<Participante>.from(
            json["participantes"].map((x) => Participante.fromJson(x))),
        aulas: List<Aula>.from(json["aulas"].map((x) => Aula.fromJson(x))),
        materiaisDeAula: List<MateriaisDeAula>.from(
            json["materiais_de_aula"].map((x) => MateriaisDeAula.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "ano_letivo": anoLetivo,
        "periodo_letivo": periodoLetivo,
        "componente_curricular": componenteCurricular,
        "professores": List<dynamic>.from(professores.map((x) => x.toJson())),
        "locais_de_aula": List<dynamic>.from(locaisDeAula.map((x) => x)),
        "data_inicio":
            "${dataInicio.year.toString().padLeft(4, '0')}-${dataInicio.month.toString().padLeft(2, '0')}-${dataInicio.day.toString().padLeft(2, '0')}",
        "data_fim":
            "${dataFim.year.toString().padLeft(4, '0')}-${dataFim.month.toString().padLeft(2, '0')}-${dataFim.day.toString().padLeft(2, '0')}",
        "participantes":
            List<dynamic>.from(participantes.map((x) => x.toJson())),
        "aulas": List<dynamic>.from(aulas.map((x) => x.toJson())),
        "materiais_de_aula": List<dynamic>.from(materiaisDeAula.map((x) => x)),
      };
}

class Aula {
  int etapa;
  String professor;
  DateTime data;
  int quantidade;
  String conteudo;

  Aula({
    this.etapa,
    this.professor,
    this.data,
    this.quantidade,
    this.conteudo,
  });

  factory Aula.fromJson(Map<String, dynamic> json) => Aula(
        etapa: json["etapa"],
        professor: json["professor"],
        data: DateTime.parse(json["data"]),
        quantidade: json["quantidade"],
        conteudo: json["conteudo"],
      );

  Map<String, dynamic> toJson() => {
        "etapa": etapa,
        "professor": professor,
        "data":
            "${data.year.toString().padLeft(4, '0')}-${data.month.toString().padLeft(2, '0')}-${data.day.toString().padLeft(2, '0')}",
        "quantidade": quantidade,
        "conteudo": conteudo,
      };
}

class Participante {
  String matricula;
  String foto;
  String email;
  String nome;

  Participante({
    this.matricula,
    this.foto,
    this.email,
    this.nome,
  });

  factory Participante.fromJson(Map<String, dynamic> json) => Participante(
        matricula: json["matricula"],
        foto: json["foto"].replaceFirst('fotos', 'alunos'),
        email: json["email"],
        nome: json["nome"],
      );

  Map<String, dynamic> toJson() => {
        "matricula": matricula,
        "foto": foto,
        "email": email,
        "nome": nome,
      };
}

class MateriaisDeAula {
  String url;
  DateTime dataVinculacao;
  String descricao;

  MateriaisDeAula({
    this.url,
    this.dataVinculacao,
    this.descricao,
  });

  factory MateriaisDeAula.fromJson(Map<String, dynamic> json) =>
      MateriaisDeAula(
        url: json["url"],
        dataVinculacao: DateTime.parse(json["data_vinculacao"]),
        descricao: json["descricao"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "data_vinculacao":
            "${dataVinculacao.year.toString().padLeft(4, '0')}-${dataVinculacao.month.toString().padLeft(2, '0')}-${dataVinculacao.day.toString().padLeft(2, '0')}",
        "descricao": descricao,
      };
}
