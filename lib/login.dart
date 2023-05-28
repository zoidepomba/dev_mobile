import 'dart:convert';
import 'package:flutter/material.dart';
import 'curso.dart';
import 'objects.dart';
import 'reset_senha.dart';
import 'package:http/http.dart' as http;

class LoginApp extends StatelessWidget {
  const LoginApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
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
              MaterialPageRoute(builder: (context) => const SelectedCurso()));
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
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
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(onPressed: _login, child: const Text('Login')),
            ElevatedButton(
              child: const Text('Esqueci minha senha'),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ResetSenhaApp()),
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
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Cursos'),
      ),
      body: const Center(
        child: Text('Bem-vindo à tela inicial!'),
      ),
    );
  }
}
