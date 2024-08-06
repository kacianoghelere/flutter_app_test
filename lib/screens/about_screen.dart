import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  final String title;

  const AboutScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text('Desenvolvido por Kacinão')
      )
    );
  }
}