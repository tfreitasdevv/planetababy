class CardapioModel {
  int id;
  String data;
  String tipoCardapio;
  String colacao;
  String lanche;
  String almocoJanta;
  String suco;
  int semana;
  int ano;

  CardapioModel({
      this.id,
      this.data,
      this.tipoCardapio,
      this.colacao,
      this.lanche,
      this.almocoJanta,
      this.suco,
      this.semana,
      this.ano});

  CardapioModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = json['data'];
    // tipoCardapio = json['tipoCardapio'] != null
    //     ? new TipoCardapio.fromJson(json['tipoCardapio'])
    //     : null;
    colacao = json['colacao'];
    lanche = json['lanche'];
    almocoJanta = json['almocoJanta'];
    suco = json['suco'];
    semana = json['semana'];
    ano = json['ano'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    // if (this.tipoCardapio != null) {
    //   data['tipoCardapio'] = this.tipoCardapio.toJson();
    // }
    data['colacao'] = this.colacao;
    data['lanche'] = this.lanche;
    data['almocoJanta'] = this.almocoJanta;
    data['suco'] = this.suco;
    data['semana'] = this.semana;
    data['ano'] = this.ano;
    return data;
  }
}

class TipoCardapio {
  int cod;
  String descricao;

  TipoCardapio({this.cod, this.descricao});

  TipoCardapio.fromJson(Map<String, dynamic> json) {
    cod = json['cod'];
    descricao = json['descricao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cod'] = this.cod;
    data['descricao'] = this.descricao;
    return data;
  }
}