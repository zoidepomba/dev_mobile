import 'package:flutter/material.dart';

class PagamentosScreen extends StatelessWidget {
  const PagamentosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamentos'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Boletos',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              BoletoItem(
                titulo: 'Boleto 1',
                dataValidade: '10/01/2023',
                dataPagamento: '08/01/2023',
                status: StatusPagamento.pago,
              ),
              BoletoItem(
                titulo: 'Boleto 2',
                dataValidade: '10/02/2023',
                dataPagamento: '09/02/2023',
                status: StatusPagamento.pago,
              ),
              BoletoItem(
                titulo: 'Boleto 3',
                dataValidade: '10/03/2023',
                dataPagamento: '10/03/2023',
                status: StatusPagamento.pago,
              ),
              BoletoItem(
                titulo: 'Boleto 4',
                dataValidade: '10/04/2023',
                dataPagamento: '12/04/2023',
                status: StatusPagamento.pago,
              ),
              BoletoItem(
                titulo: 'Boleto 5',
                dataValidade: '10/05/2023',
                dataPagamento: '11/05/2023',
                status: StatusPagamento.pendente,
              ),
              BoletoItem(
                titulo: 'Boleto 6',
                dataValidade: '10/06/2023',
                dataPagamento: '---',
                status: StatusPagamento.emAberto,
              ),
              BoletoItem(
                titulo: 'Boleto 7',
                dataValidade: '10/07/2023',
                dataPagamento: '---',
                status: StatusPagamento.emAberto,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum StatusPagamento { pago, pendente, emAberto }

class BoletoItem extends StatelessWidget {
  final String titulo;
  final String dataValidade;
  final String dataPagamento;
  final StatusPagamento status;

  const BoletoItem({
    super.key,
    required this.titulo,
    required this.dataValidade,
    required this.dataPagamento,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    String statusText;
    String message = '';

    switch (status) {
      case StatusPagamento.pago:
        statusColor = Colors.green;
        statusText = 'Pago';
        message = 'Pagamento realizado com sucesso.';
        break;
      case StatusPagamento.pendente:
        statusColor = Colors.amber;
        statusText = 'Pendente';
        message = 'Deseja enviar por email?';
        break;
      case StatusPagamento.emAberto:
        statusColor = const Color.fromARGB(255, 129, 129, 129);
        statusText = 'Em Aberto';
        message = 'Não disponivel para pagamento no momento!';
        break;
    }

    return GestureDetector(
      onTap: () {
        if (status == StatusPagamento.pago) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text("Infomação"),
                  content: const Text("Boleto já foi pago."),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Ok'),
                    ),
                  ],
                );
              });
        } else if (status == StatusPagamento.pendente) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text('Aviso'),
                content: const Text('Deseja enviar o boleto por email?'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('Informação'),
                              content: const Text('Boleto enviado por email.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('Em breve estará no email'),
                                ),
                              ],
                            );
                          });
                    },
                    child: const Text('Sim'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Não'),
                  ),
                ],
              );
            },
          );
        }
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        padding: const EdgeInsets.all(16.0),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  statusText,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: statusColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Text(
              'Data de validade: $dataValidade',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 8.0),
            Text(
              'Data de pagamento: $dataPagamento',
              style: const TextStyle(fontSize: 16),
            ),
            if (message.isNotEmpty) const SizedBox(height: 8.0),
            if (message.isNotEmpty)
              Text(
                message,
                style: const TextStyle(fontSize: 16),
              ),
          ],
        ),
      ),
    );
  }
}
