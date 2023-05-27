import 'dart:convert';

import 'package:data_trend/products.dart';
import 'package:data_trend/tell_with_us.dart';
import 'package:data_trend/contacts.dart';
import 'package:flutter/material.dart';
import 'contacts.dart';
import 'curso.dart';
import 'objects.dart';
import 'reset_senha.dart';
import 'package:http/http.dart' as http;

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

//retorna uma lista do banco de dados
Future<List<Aluno>> fetchContacts() async {
  final response = await http.get(
      Uri.parse('https://escola-moba-default-rtdb.firebaseio.com/aluno.json'));

  if (response.statusCode == 200) {
    final responseData = jsonDecode(response.body);
    List<Aluno> alunos = [];
    if (responseData.length == 0) {
      return alunos;
    }
    responseData.entries.forEach((e) => alunos.add(Aluno(
        id: e.key,
        nomeAluno: e.value['nome_aluno'],
        pass: e.value['senha'],
        email: e.value['email'])));
    // print(contacts);
    return alunos;
  } else {
    throw Exception('Falha ao recuperar histórico de contatos');
  }
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    //logica de autenticacao
    fetchContacts().then((List<Aluno> alunos) {
      for (Aluno aluno in alunos) {
        if (email == aluno.email && password == aluno.pass) {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SelectedCurso()));
        } else {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                    title: Text('Erro de autenticação'),
                    content: Text(
                        'Credenciais invalidas. Por favor, tente novamente'),
                    actions: <Widget>[
                      /*TextButton(
                child: Text('OK'),
                onPressed () {
                  Navigator.of(context).pop();
                }
              ),*/
                    ]);
              });
        }
      }
    });

    // if (email == alunos && password == 'teste123456') {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => SelectedCurso()),
    //   );
    // } else {
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //             title: Text('Erro de autenticação'),
    //             content:
    //                 Text('Credenciais invalidas. Por favor, tente novamente'),
    //             actions: <Widget>[
    //               /*TextButton(
    //             child: Text('OK'),
    //             onPressed () {
    //               Navigator.of(context).pop();
    //             }
    //           ),*/
    //             ]);
    //       });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bem vindo a Universidade do Canãa (UNICAN)',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              'assets/logo.jpeg',
              width: 200,
              height: 200,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(child: Text('Login'), onPressed: _login),
            ElevatedButton(
              child: Text('Esqueci minha senha'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => ResetSenhaApp()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Cursos'),
      ),
      body: Center(
        child: Text('Bem-vindo à tela inicial!'),
      ),
    );
  }
}
