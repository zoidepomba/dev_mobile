class Contact {
  final String? id;
  final String usuario;
  final String telefone;
  final String email;
  final String mensagem;
  final String dataHora;

  const Contact({
    this.id,
    required this.usuario,
    required this.telefone,
    required this.email,
    required this.mensagem,
    required this.dataHora,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      usuario: json['nome'],
      telefone: json['telefone'],
      email: json['email'],
      mensagem: json['mensagem'],
      dataHora: json['data_hora'],
    );
  }

  Map getJson() {
    var contato = new Map();
    contato['nome'] = usuario;
    contato['telefone'] = telefone;
    contato['email'] = email;
    contato['mensagem'] = mensagem;
    contato['data_hora'] = dataHora;
    return contato;
  }
}

class Aluno {
  final String? id;
  final String nomeAluno;
  final String email;
  final String pass;

  const Aluno(
      {this.id,
      required this.nomeAluno,
      required this.email,
      required this.pass});

  Map getJson() {
    var aluno = new Map();
    aluno['nome_aluno'] = nomeAluno;
    aluno['senha'] = pass;
    aluno['email'] = email;
    return aluno;
  }
}
