// To parse this JSON data, do
//
//     final reportCard = reportCardFromJson(jsonString);

import 'dart:convert';

import 'dart:typed_data';

List<ReportCard> reportCardFromJson(Uint8List str) => List<ReportCard>.from(
    json.decode(utf8.decode(str)).map((x) => ReportCard.fromJson(x)));

String reportCardToJson(List<ReportCard> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReportCard {
  String? codigoDiario;
  String? disciplina;
  bool? segundoSemestre;
  int? cargaHoraria;
  int? cargaHorariaCumprida;
  int? numeroFaltas;
  int? percentualCargaHorariaFrequentada;
  String? situacao;
  int? quantidadeAvaliacoes;
  Nota? notaEtapa1;
  Nota? notaEtapa2;
  Nota? notaEtapa3;
  Nota? notaEtapa4;
  double? mediaDisciplina;
  Nota? notaAvaliacaoFinal;
  double? mediaFinalDisciplina;

  ReportCard({
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

  factory ReportCard.fromJson(Map<String, dynamic> json) => ReportCard(
        codigoDiario: json["codigo_diario"],
        disciplina: json["disciplina"],
        segundoSemestre: json["segundo_semestre"],
        cargaHoraria: json["carga_horaria"],
        cargaHorariaCumprida: json["carga_horaria_cumprida"],
        numeroFaltas: json["numero_faltas"],
        percentualCargaHorariaFrequentada:
            json["percentual_carga_horaria_frequentada"],
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
        mediaFinalDisciplina: json["media_final_disciplina"] == null
            ? null
            : json["media_final_disciplina"].toDouble(),
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
        "nota_etapa_1": notaEtapa1!.toJson(),
        "nota_etapa_2": notaEtapa2!.toJson(),
        "nota_etapa_3": notaEtapa3!.toJson(),
        "nota_etapa_4": notaEtapa4!.toJson(),
        "media_disciplina": mediaDisciplina == null ? null : mediaDisciplina,
        "nota_avaliacao_final": notaAvaliacaoFinal!.toJson(),
        "media_final_disciplina":
            mediaFinalDisciplina == null ? null : mediaFinalDisciplina,
      };
}

class Nota {
  double? nota;
  int? faltas;

  Nota({
    this.nota,
    this.faltas,
  });

  factory Nota.fromJson(Map<String, dynamic> json) => Nota(
        nota: json["nota"] == null ? null : json["nota"].toDouble(),
        faltas: json["faltas"],
      );

  Map<String, dynamic> toJson() => {
        "nota": nota == null ? null : nota,
        "faltas": faltas,
      };
}
