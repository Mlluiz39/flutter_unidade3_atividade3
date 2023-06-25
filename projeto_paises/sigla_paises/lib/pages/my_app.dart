import 'package:flutter/material.dart';
import 'package:sigla_paises/pages/paises_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Sigla dos Países',
      home: PaisesScreen(),
    );
  }
}

