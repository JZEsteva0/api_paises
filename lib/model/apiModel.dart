class ApiModel {
  String nome;
  String descricao;
  bool localizacao;

  ApiModel({
      required this.nome,
      required this.descricao,
      required this.localizacao});

  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
        nome: json['userId'],
        descricao: json['id'],
        localizacao: json['completed']);
  }
}