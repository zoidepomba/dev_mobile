import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
      ),
      body: ListView(
        children: const <Widget>[
          ContactCard(
            name: 'Professor 1',
            email: 'professor1@example.com',
            phone: '+1 1234567890',
          ),
          ContactCard(
            name: 'Professor 2',
            email: 'professor2@example.com',
            phone: '+1 9876543210',
          ),
          ContactCard(
            name: 'Professor 3',
            email: 'professor3@example.com',
            phone: '+1 5555555555',
          ),
          ContactCard(
            name: 'Coordenador',
            email: 'coordenador@example.com',
            phone: '+1 9999999999',
          ),
        ],
      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  const ContactCard(
      {super.key,
      required this.name,
      required this.email,
      required this.phone});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              'Email: $email',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 5),
            Text(
              'Telefone: $phone',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
