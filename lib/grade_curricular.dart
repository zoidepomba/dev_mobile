import 'package:flutter/material.dart';
import 'home.dart';

class SelectedCursoGrade extends StatelessWidget {
  const SelectedCursoGrade({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      home: const HomeGrade(),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}

class HomeGrade extends StatefulWidget {
  const HomeGrade({super.key});

  @override
  State<HomeGrade> createState() {
    return HomeStateGrade();
  }
}

class HomeStateGrade extends State<HomeGrade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grade Curricular'),
      ),
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: const Text('Programação Orientada a Objetos 2'),
                onPressed: () => _sobre_poo(context),
              ),
              ElevatedButton(
                child: const Text('Desenvolvimento WEB'),
                onPressed: () => _sobre_web(context),
              ),
              ElevatedButton(
                child: const Text('Desenvolvimento Mobile'),
                onPressed: () => sobre_mobile(context),
              ),
              ElevatedButton(
                child: const Text('Segurança da Informação'),
                onPressed: () => sobre_seguranca(context),
              ),
            ]),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Future<void> _sobre_poo(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sobre'),
          content: const Text('Nessa Matéria você vai aprender sobre:\n\n'
              'O que é orientação a objetos?\n\n'
              'Ideia básica da Orientação a objetos(OO)\n\n'
              'Classes, Atributos, Métodos e objetos o que são cada um?\n\n'
              'Começar com POO\n'),
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
  Future<void> _sobre_web(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sobre'),
          content: const Text('Nessa Matéria você vai aprender sobre:\n\n'
              'O que é programação web?\n\n'
              'A evolução da programação\n\n'
              'As diferença entre programação e codificação\n\n'
              'Por que e importante aprender a programar web?\n\n'
              'Sites para aprender como programar de graça\n\n'
              'Conclusão da matéria'),
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

  Future<void> sobre_mobile(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sobre'),
          content: const Text('Nessa Matéria você vai aprender sobre:\n\n'
              'O que é desenvolvimento mobile?\n\n'
              'O que faz um desenvolvedor mobile?\n\n'
              'Comparação com outros perfis de profissionais\n\n'
              'Quais as linguagens utilizamos no Desenvolvimento Mobile?\n\n'
              'Quais as principais plataformas de desenvolvimento mobile?\n\n'
              'Quais são os tipos de desenvolvimento mobile?\n\n'
              'Qual a importância do desenvolvimento mobile para o mercado?\n\n'
              'Quais são os desafios do desenvolvimento para mobile?'),
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

  Future<void> sobre_seguranca(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sobre'),
          content: const Text('Nessa Matéria você vai aprender sobre:\n\n'
              'Introdução a Segurança da Informação\n\n'
              'Aulas Dinâmicas e teoria\n\n'
              'Aulas práticas\n\n'
              'Estudo sem internet\n\n'
              'Metodos Hiperlink\n\n'
              'Gestão de Tempo\n\n'),
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
