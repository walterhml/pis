class Servico {
  final int id;
  final String tipoServico;
  final String descricao;
  final String preco;

  Servico({
    required this.id,
    required this.tipoServico,
    required this.descricao,
    required this.preco,
  });

  // Método para converter o JSON em objeto Dart
  factory Servico.fromJson(Map<String, dynamic> json) {
    return Servico(
      id: json['ID'],
      tipoServico: json['tipo_servico'],
      descricao: json['descricao'],
      preco: json['preco'],
    );
  }
}
