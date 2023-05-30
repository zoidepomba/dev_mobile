import 'package:flutter/material.dart';

class CarteirinhaDigital extends StatelessWidget {
  final String nome;
  final String dataNascimento;
  final String curso;
  final String numeroCarteirinha;
  final String instituicao;

  const CarteirinhaDigital({
    super.key,
    required this.nome,
    required this.dataNascimento,
    required this.curso,
    required this.numeroCarteirinha,
    required this.instituicao,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carteirinha Digital'),
      ),
      body: Center(
        child: Column(
          children: [
            // Frente da carteirinha
            Container(
              width: 300,
              height: 180,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 3.0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'FRENTE',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Nome: $nome',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Data de Nascimento: $dataNascimento',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Curso: $curso',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            // Verso da carteirinha
            Container(
              width: 300,
              height: 180,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 3.0,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'VERSO',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Número da Carteirinha: $numeroCarteirinha',
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      'Instituição: $instituicao',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void mostrarVersoCarteirinha(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Verso da Carteirinha'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Número da Carteirinha: $numeroCarteirinha',
                style: const TextStyle(fontSize: 16),
              ),
              Text(
                'Instituição: $instituicao',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}

// Exemplo de uso:
// class MyCarteirinhaScreen extends StatelessWidget {
//   const MyCarteirinhaScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Minha Carteirinha'),
//       ),
//       body: const Center(
//         child: CarteirinhaDigital(
//           nome: 'John Doe',
//           dataNascimento: '01/01/1990',
//           curso: 'Engenharia de Software',
//           numeroCarteirinha: '123456789',
//           instituicao: 'Universidade XYZ',
//         ),
//       ),
//     );
//   }
// }
