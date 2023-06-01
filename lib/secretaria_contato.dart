import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SecretatiaContatoScreen extends StatelessWidget {
  const SecretatiaContatoScreen({super.key});

  void abrirUrl() async {
    const url = 'https://flutterando.com.br/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contato secretatia'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: abrirUrl,
          child: const Text('Abrir URL'),
        ),
      ),
    );
  }
}
