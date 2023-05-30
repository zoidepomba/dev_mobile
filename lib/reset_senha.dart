import 'package:flutter/material.dart';
import 'login.dart';

class ResetSenhaApp extends StatelessWidget {
  const ResetSenhaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reset',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ResetSenhaPage(),
    );
  }
}

class ResetSenhaPage extends StatefulWidget {
  const ResetSenhaPage({super.key});

  @override
  State<ResetSenhaPage> createState() {
    return _ResetSenhaState();
  }
}

class _ResetSenhaState extends State<ResetSenhaPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset de .senha'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              decoration: const InputDecoration(
                labelText: 'E-mail',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                labelText: 'Data de Nascimento',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 24.0),
            ElevatedButton(
                child: const Text('Confirmar'),
                onPressed: () => _reset(context)),
          ],
        ),
      ),
    );
  }

  Future<void> _reset(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sobre'),
          content: const Text('Realizado o envio do e-mail de Reset de senha'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Voltar'),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginApp()));
              },
            ),
          ],
        );
      },
    );
  }
}
