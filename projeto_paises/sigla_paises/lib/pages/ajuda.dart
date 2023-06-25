import 'package:flutter/material.dart';

class Ajuda extends StatelessWidget {
  const Ajuda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('Ajuda'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Text(
            'Esse aplicativo tem o objetivo de mostrar e pesquisar a sigla dos países.'),
      ),
    );
  }
}
