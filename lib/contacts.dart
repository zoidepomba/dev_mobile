import 'dart:async';
import 'dart:convert';
import 'package:data_trend/home.dart';
import 'package:data_trend/objects.dart';
import 'package:data_trend/products.dart';
import 'package:data_trend/tell_with_us.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Contact>> fetchContacts() async {
  final response = await http
      .get(Uri.parse('https://data-trend-app-default-rtdb.firebaseio.com/messages.json'));

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    List<Contact> contacts = [];
    if (responseData.length == 0) {
      return contacts;
    }
    responseData.entries.forEach(
      (e) => contacts.add(
        Contact(
          id: e.key, 
          usuario: e.value['nome'], 
          telefone: e.value['telefone'],
          email: e.value['email'],
          mensagem: e.value['mensagem'],
          dataHora: e.value['data_hora']
        )
      )
    );
    // print(contacts);
    return contacts;
  } else {
    throw Exception('Falha ao recuperar histórico de contatos');
  }
}

class ContactsWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Contacts(),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }

}

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => ContactsState();
}

class ContactsState extends State<Contacts> {
  late Future<List<Contact>> contacts;

  @override
  void initState() {
    super.initState();
    contacts = fetchContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Histórico de Mensagens'),
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
      body: Center(
        child: FutureBuilder<List<Contact>>(
          future: contacts,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx, i) => ContactCard(ctt: snapshot.data!.elementAt(i)),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Text('DATA TREND\n\nA parceria que você precisa!'),
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Fale conosco'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TellWithUsWidget()),
                );
              },
            ),
          ],
        ),
      )    
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
            'Nesta tela você acessa todo o histórico '
            'de mensagens enviadas aqui pelo App.'
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

class ContactCard extends StatelessWidget {
  final Contact ctt;
  const ContactCard({super.key, required this.ctt});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.message),
      title: Text(ctt.usuario),
      subtitle: Text(ctt.dataHora),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.remove_red_eye),
              color: Colors.blueGrey,
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => Dialog.fullscreen(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('Telefone:'),
                      Text(ctt.telefone),
                      Text(''),
                      Text('Endereço de e-mail:'),
                      Text(ctt.email),
                      Text(''),
                      Text('Mensagem do usuário:'),
                      Text(ctt.mensagem),
                      const SizedBox(height: 15),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Voltar'),
                      ),
                    ],
                  ),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }

}