class StudentData {
  String matricula;
  String nomeUsual;
  String urlFoto;
  Vinculo vinculo;

  StudentData(
      {this.matricula, this.nomeUsual, this.urlFoto, this.vinculo});

  StudentData.fromJson(Map<String, dynamic> json) {
    matricula = json['matricula'];
    nomeUsual = json['nome_usual'];
    urlFoto = json['url_foto_75x100'];
    vinculo =
        json['vinculo'] != null ? new Vinculo.fromJson(json['vinculo']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['matricula'] = this.matricula;
    data['nome_usual'] = this.nomeUsual;
    data['url_foto_75x100'] = this.urlFoto;
    if (this.vinculo != null) {
      data['vinculo'] = this.vinculo.toJson();
    }
    return data;
  }
}

class Vinculo {
  String nome;
  String curso;
  String campus;
  String situacao;
  String cotaMec;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['curso'] = this.curso;
    data['campus'] = this.campus;
    data['situacao'] = this.situacao;
    data['cota_mec'] = this.cotaMec;
    return data;
  }
}
