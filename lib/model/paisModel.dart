class PaisModel {
  final String nome;
  final String descricao;
  final bool localizacao;
  final Stream paisImage;

  PaisModel({
    required this.nome,
    required this.descricao, 
    required this.localizacao,
    required this.paisImage
  });

factory PaisModel.fromJson(Map<String, dynamic>json){
  return PaisModel(
      nome: json['nome'] ?? '',
      descricao: json['descricao'] ?? '',
      localizacao: json['localizacao'] ?? '', 
      paisImage: json['imagem'] ?? '', 
  );
}


}