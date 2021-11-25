// To parse this JSON data, do
//
//     final reportCardModel = reportCardModelFromJson(jsonString);

import 'dart:convert';

List<ReportCardModel> reportCardModelFromJson(List items) =>
    List<ReportCardModel>.from(items.map((x) => ReportCardModel.fromJson(x)));

String reportCardModelToJson(List<ReportCardModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReportCardModel {
  ReportCardModel({
    this.codigoDiario,
    this.disciplina,
    this.segundoSemestre,
    this.cargaHoraria,
    this.cargaHorariaCumprida,
    this.numeroFaltas,
    this.percentualCargaHorariaFrequentada,
    this.situacao,
    this.quantidadeAvaliacoes,
    this.notaEtapa1,
    this.notaEtapa2,
    this.notaEtapa3,
    this.notaEtapa4,
    this.mediaDisciplina,
    this.notaAvaliacaoFinal,
    this.mediaFinalDisciplina,
  });

  String? codigoDiario;
  String? disciplina;
  bool? segundoSemestre;
  int? cargaHoraria;
  int? cargaHorariaCumprida;
  int? numeroFaltas;
  double? percentualCargaHorariaFrequentada;
  String? situacao;
  int? quantidadeAvaliacoes;
  Nota? notaEtapa1;
  Nota? notaEtapa2;
  Nota? notaEtapa3;
  Nota? notaEtapa4;
  double? mediaDisciplina;
  Nota? notaAvaliacaoFinal;
  String? mediaFinalDisciplina;

  factory ReportCardModel.fromJson(Map<String, dynamic> json) =>
      ReportCardModel(
        codigoDiario: json["codigo_diario"],
        disciplina: json["disciplina"],
        segundoSemestre: json["segundo_semestre"],
        cargaHoraria: json["carga_horaria"],
        cargaHorariaCumprida: json["carga_horaria_cumprida"],
        numeroFaltas: json["numero_faltas"],
        percentualCargaHorariaFrequentada:
            json["percentual_carga_horaria_frequentada"].toDouble(),
        situacao: json["situacao"],
        quantidadeAvaliacoes: json["quantidade_avaliacoes"],
        notaEtapa1: Nota.fromJson(json["nota_etapa_1"]),
        notaEtapa2: Nota.fromJson(json["nota_etapa_2"]),
        notaEtapa3: Nota.fromJson(json["nota_etapa_3"]),
        notaEtapa4: Nota.fromJson(json["nota_etapa_4"]),
        mediaDisciplina: json["media_disciplina"] == null
            ? 0.0
            : json["media_disciplina"].toDouble(),
        notaAvaliacaoFinal: Nota.fromJson(json["nota_avaliacao_final"]),
        mediaFinalDisciplina: json["media_final_disciplina"] ?? "0.0",
      );

  Map<String, dynamic> toJson() => {
        "codigo_diario": codigoDiario,
        "disciplina": disciplina,
        "segundo_semestre": segundoSemestre,
        "carga_horaria": cargaHoraria,
        "carga_horaria_cumprida": cargaHorariaCumprida,
        "numero_faltas": numeroFaltas,
        "percentual_carga_horaria_frequentada":
            percentualCargaHorariaFrequentada,
        "situacao": situacao,
        "quantidade_avaliacoes": quantidadeAvaliacoes,
        "nota_etapa_1": notaEtapa1?.toJson(),
        "nota_etapa_2": notaEtapa2?.toJson(),
        "nota_etapa_3": notaEtapa3?.toJson(),
        "nota_etapa_4": notaEtapa4?.toJson(),
        "media_disciplina": mediaDisciplina ?? 0.0,
        "nota_avaliacao_final": notaAvaliacaoFinal?.toJson(),
        "media_final_disciplina": mediaFinalDisciplina ?? "0.0",
      };
}

class Nota {
  Nota({
    this.nota,
    this.faltas,
  });

  double? nota;
  int? faltas;

  factory Nota.fromJson(Map<String, dynamic> json) => Nota(
        nota: json["nota"] == null ? 0.0 : json["nota"].toDouble(),
        faltas: json["faltas"],
      );

  Map<String, dynamic> toJson() => {
        "nota": nota ?? 0.0,
        "faltas": faltas,
      };
}
