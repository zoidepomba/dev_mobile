import 'dart:convert';

import 'package:data_trend/products.dart';
import 'package:data_trend/objects.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'home.dart';
import 'contacts.dart';

class TellWithUsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text('Fale conosco'),
            actions: [
              PopupMenuButton(
                itemBuilder: (context){
                  return [
                    PopupMenuItem(
                      child: const Text('Sobre'),
                      onTap: () => _sobre(context),
                    ),
                  ];
                })
            ],
        ),
        body: TellWithUs(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Text('DATA TREND\nA parceria que você precisa!'),
              ),
              ListTile(
                title: const Text('Página inicial'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeWidget()),
                  );
                },
              ),
              ListTile(
                title: const Text('Produtos'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProductWidget()),
                  );
                },
              ),
            ListTile(
              title: const Text('Mensagens Recebidas'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactsWidget()),
                );
              },
            ),
              ListTile(
                title: const Text('Fale conosco'),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }

    Future<void> _sobre(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sobre'),
          content: const Text(
            'Desenvolvido por:\n'
            'Hebert Alves, professor de Desenvolvimento '
            'Mobile da turma de 2023-1\n\n'
            'Nesta tela o usuário envia mensagens para a '
            'empresa através deste formulário com perguntas '
            'simples e todos com validação de preenchimento.'
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Voltar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class TellWithUs extends StatefulWidget {
  @override
  State<TellWithUs> createState() {
    return TellWithUsState();
  }
}

class TellWithUsState extends State<TellWithUs>{
  final _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};
  static const _databaseUrl = 'https://data-trend-app-default-rtdb.firebaseio.com/';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text("  Digite seu nome completo:",),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor preencha o campo acima';
              }
              else {
                _formData['usuario'] = value;
              }
              return null;
            },
          ),
          Text("  Digite seu telefone de contato:",),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor preencha o campo acima';
              }
              else {
                _formData['telefone'] = value;
              }
              return null;
            },
          ),
          Text("\n  Digite seu e-mail:",),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor preencha o campo acima';
              }
              else {
                _formData['email'] = value;
              }
              return null;
            },
          ),
          Text("\n  Qual a sua mensagem para nossa equipe:",),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor preencha o campo acima';
              }
              else {
                _formData['mensagem'] = value;
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                final validation = _formKey.currentState!.validate();
                if (validation) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processando sua mensagem...')),
                  );
                  final DateTime dateAgora = DateTime.now();
                  final DateFormat dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
                  final String strAgora = dateFormat.format(dateAgora);
                  final Contact contact = Contact(
                    usuario: _formData['usuario'], 
                    telefone: _formData['telefone'], 
                    email: _formData['email'], 
                    mensagem: _formData['mensagem'], 
                    dataHora: strAgora
                  );
                  final response = await http.post(
                    Uri.parse("$_databaseUrl/messages.json"),
                    body: json.encode(contact.getJson()),
                  );
                  final responseMap = json.decode(response.body);
                  if (responseMap.containsKey('name')) {
                    // _formKey.currentState?.reset();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeWidget()),
                    );
                  }
                  else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Erro ao enviar mensagem... :-(')),
                    );
                  }
                }
              },
              child: const Text(' Enviar '),
            ),
          ),
        ],
      ),
    );
  }
}