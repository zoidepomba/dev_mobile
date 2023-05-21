import 'package:data_trend/products.dart';
import 'package:data_trend/tell_with_us.dart';
import 'package:data_trend/contacts.dart';
import 'package:flutter/material.dart';
import 'contacts.dart';

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

class HomeState extends State<Home>{
  @override
  static int _counter = 0;

  static int incrementCounter(){
    if (_counter < 10) {
      _counter++;
    }
    else {
      _counter+= 5;
    }
    return _counter;
  }

  static int recycleCounter(){
    _counter = 0;
    return _counter;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Data Trend Consultoria'),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  recycleCounter();
                });
              }, 
              icon: const Icon(Icons.delete_sweep),
            ),
            PopupMenuButton(
              itemBuilder: (context){
                return [
                  PopupMenuItem(
                    child: const Text('Zerar contador'),
                    onTap:() {
                      setState(() {
                        recycleCounter();
                      });
                    },
                  ),
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
            ]
          ),
          onTap: () {
            setState(() {
              incrementCounter();
            });
          },
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 75.0,),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            incrementCounter();
          });
        },
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TellWithUsWidget()),
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
          content: const Text(
            'Desenvolvido por:\n'
            'Hebert Alves, professor de Desenvolvimento '
            'Mobile da turma de 2023-1\n\n'
            'Aqui é a home do nosso App, a partir dela '
            'o usuário inicia a experiência de uso de '
            'todas as funções criadas.'
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