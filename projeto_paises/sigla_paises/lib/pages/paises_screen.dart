import 'package:flutter/material.dart';
import 'package:sigla_paises/pages/menu.dart';
import 'package:sigla_paises/pages/paises_dados.dart';

class PaisesScreen extends StatelessWidget {
  final String pais;

  const PaisesScreen({super.key, this.pais = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('Sigla Países'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const PaisesScreen(pais: ''),
                ),
              );
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: PaisesDados(pais: pais),
      drawer: const Menu(),
    );
  }
}
