import 'package:data_trend/products.dart';
import 'package:data_trend/tell_with_us.dart';
import 'package:data_trend/contacts.dart';
import 'package:flutter/material.dart';
import 'contacts.dart';
import 'curso.dart';
import 'agenda.dart';

class HomeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  @override
  static int _counter = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Trend Consultoria'),
        actions: [
          PopupMenuButton(itemBuilder: (context) {
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
        child: GestureDetector(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Seja muito bem-vindo\na\nDATA TREND',
                  style: TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '\nContador: $_counter',
                  style: TextStyle(fontSize: 20),
                ),
              ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 75.0,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Agenda de Eventos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgendaScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Secretaria'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactsWidget()),
                );
              },
            ),
            ListTile(
              title: const Text('Calendario Academico'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TellWithUsWidget()),
                );
              },
            ),
            ListTile(
              title: const Text('Grade Curricular'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TellWithUsWidget()),
                );
              },
            ),
            ListTile(
              title: const Text('Lista de Contatos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TellWithUsWidget()),
                );
              },
            ),
            ListTile(
              title: const Text('Tela de Cursos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SelectedCurso()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _sobre(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sobre'),
          content: const Text('Desenvolvido por:\n'
              'Hebert Alves, professor de Desenvolvimento '
              'Mobile da turma de 2023-1\n\n'
              'Aqui é a home do nosso App, a partir dela '
              'o usuário inicia a experiência de uso de '
              'todas as funções criadas.'),
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
