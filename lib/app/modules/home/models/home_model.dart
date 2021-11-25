class StudentData {
  String? matricula;
  String? nomeUsual;
  String? urlFoto;
  Vinculo? vinculo;

  StudentData({this.matricula, this.nomeUsual, this.urlFoto, this.vinculo});

  StudentData.fromJson(Map<String, dynamic> json) {
    matricula = json['matricula'];
    nomeUsual = json['nome_usual'];
    urlFoto = json['url_foto_75x100'];
    vinculo =
        json['vinculo'] != null ? Vinculo.fromJson(json['vinculo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['matricula'] = matricula;
    data['nome_usual'] = nomeUsual;
    data['url_foto_75x100'] = urlFoto;
    if (vinculo != null) {
      data['vinculo'] = vinculo!.toJson();
    }
    return data;
  }
}

class Vinculo {
  String? nome;
  String? curso;
  String? campus;
  String? situacao;
  String? cotaMec;

  Vinculo({
    this.nome,
    this.curso,
    this.campus,
    this.situacao,
    this.cotaMec,
  });

  Vinculo.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    curso = json['curso'];
    campus = json['campus'];
    situacao = json['situacao'];
    cotaMec = json['cota_mec'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['curso'] = curso;
    data['campus'] = campus;
    data['situacao'] = situacao;
    data['cota_mec'] = cotaMec;
    return data;
  }
}
