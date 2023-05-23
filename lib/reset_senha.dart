import 'package:data_trend/products.dart';
import 'package:data_trend/tell_with_us.dart';
import 'package:data_trend/contacts.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class ResetSenhaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reset',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ResetSenhaPage(),
    );
  }
}

class ResetSenhaPage extends StatefulWidget {
  @override
  State<ResetSenhaPage> createState() {
    return _ResetSenhaState();
  }
}
class _ResetSenhaState extends State<ResetSenhaPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final Map<String, dynamic> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset de senha'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/logo.jpeg',
              width: 200,
              height: 200,
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                labelText: 'Data de Nascimento',
              ),
              obscureText: true,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              child: Text('Confirmar'),
              onPressed: () {
                // Implementar a lógica de autenticação aqui
                String email = _emailController.text;
                String password = _passwordController.text;
                // Faça algo com o email e a senha, como verificar a autenticidade
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginApp()),
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