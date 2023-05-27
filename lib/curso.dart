import 'package:flutter/material.dart';
import 'home.dart';

class SelectedCurso extends StatelessWidget {
  const SelectedCurso({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeCurso(),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}

class HomeCurso extends StatefulWidget {
  const HomeCurso({super.key});

  @override
  State<HomeCurso> createState() {
    return HomeStateCurso();
  }
}

class HomeStateCurso extends State<HomeCurso> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Cursos'),
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text('Sistemas de Informações'),
                onPressed: () => sobre_sitemas(context),
              ),
              ElevatedButton(
                child: const Text('Ciências da Computação'),
                onPressed: () => sobre_ciencias(context),
              ),
            ]),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> sobre_sitemas(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sobre'),
          content: const Text('Faculdade UNICAN\n'
              'Curso: Sistemas de Informação\n'
              'Turno: Noturno\n'
              'RA: 3031323234\n'
              'Status: Cursando\n'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Portal do Aluno'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeWidget()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> sobre_ciencias(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sobre'),
          content: const Text('Faculdade UNICAN\n'
              'Curso: Ciências da Computação\n'
              'Turno: Diurno\n'
              'RA: 2021222324\n'
              'Status: Cursando\n'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Portal do Aluno'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeWidget()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
