import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sigla_paises/pages/ajuda.dart';
import 'package:sigla_paises/pages/mensagem.dart';
import 'package:sigla_paises/pages/paises_screen.dart';

class Menu extends StatelessWidget with Mensagem {
  const Menu({super.key});

  get search => TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Drawer(
      child: Drawer(
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              color: Colors.orangeAccent,
              height: 100,
              child: const Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.search),
              title: const Text('Pesquisar'),
              onTap: () {
                Navigator.of(context).pop();
                showDialog(
                    context: context,
                    builder: (BuildContext context) => SimpleDialog(
                          title: const Text("Digite o nome do país"),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: TextField(
                                controller: search,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    showMessage('Operação cancelada', context);
                                  },
                                  child: const Text(
                                    'Cancelar',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            PaisesScreen(pais: search.text),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'OK',
                                    style: TextStyle(
                                      color: Colors.orangeAccent,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.help),
              title: const Text('Ajuda'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Ajuda(),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Sair'),
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const Text('Sair'),
                          content: const Text('Deseja realmente sair?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                showMessage('Operação cancelada', context);
                              },
                              child: const Text(
                                'Não',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                exit(0);
                              },
                              child: const Text(
                                'Sim',
                                style: TextStyle(
                                  color: Colors.orangeAccent,
                                ),
                              ),
                            ),
                          ],
                        ));
              },
            ),
          ],
        ),
      ),
    ));
  }
}
