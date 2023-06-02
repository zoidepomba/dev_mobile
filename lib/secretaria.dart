import 'package:data_trend/secretaria_contato.dart';
import 'package:data_trend/termo_contrato.dart';
import 'package:flutter/material.dart';
import 'carteirinha.dart';
import 'financeiro.dart';
import 'historico_escolar.dart';

class SecretariaScreen extends StatelessWidget {
  const SecretariaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Secretaria'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          buildListItem(
              context,
              'Carteirinha Digital',
              Icons.credit_card,
              'Informações da carteirinha digital',
              const CarteirinhaDigital(
                curso: 'Engenharia de Software',
                dataNascimento: '01/01/1990',
                instituicao: 'Universidade Canaã',
                nome: 'John Doe',
                numeroCarteirinha: '123456789',
              )),
          buildListItem(context, 'Financeiro', Icons.attach_money,
              'Informações financeiras', const FinanceiroScreen()),
          buildListItem(context, 'Termos de Contrato', Icons.description,
              'Termos de contrato e políticas', ContractScreen()),
          buildListItem(context, 'Histórico Escolar', Icons.history,
              'Histórico escolar do aluno', const HistoricoEscolarScreen()),
          buildListItem(
              context,
              'Contato Secretaria',
              Icons.phone,
              'Entre em contato com a secretaria',
              const SecretatiaContatoScreen()),
        ],
      ),
    );
  }

  Widget buildListItem(
    BuildContext context,
    String title,
    IconData icon,
    String description,
    Widget screen,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 3.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        leading: Icon(icon),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
      ),
    );
  }
}
