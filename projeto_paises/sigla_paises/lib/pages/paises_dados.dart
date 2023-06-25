import 'package:flutter/material.dart';
import 'package:sigla_paises/service/requisicao.dart';

class PaisesDados extends StatefulWidget {
  final String pais;

  const PaisesDados({Key? key, required this.pais}) : super(key: key);

  @override
  State<PaisesDados> createState() => _PaisesDadosState();
}

class _PaisesDadosState extends State<PaisesDados> {
  List? _paises;
  late List<bool> _mostraSigla;

  @override
  void initState() {
    super.initState();
    _buscarPaises();
  }

  void _buscarPaises() async {
    List? paises = await Requisicao.requisicaoPaises();

    setState(() {
      _paises = _filtraPais(widget.pais, paises, context);
      _mostraSigla = List<bool>.filled(_paises!.length, false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: Requisicao.requisicaoPaises(),
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            if (snapshot.hasData) {
              List? paises = snapshot.data;
              return _listaPaises(_filtraPais(widget.pais, paises, context));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }

  Widget _listaPaises(List? paises) {
    return paises != null
        ? Flexible(
            child: ListView.builder(
              itemCount: paises.length,
              itemBuilder: (context, index) {
                final String name = paises[index]['name'];
                final String code = paises[index]['code'] ?? 'Sem sigla';
                final bool mostraSiglas = _mostraSigla[index];
                return Card(
                  child: ListTile(
                    title: Row(
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.orangeAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(
                        mostraSiglas
                            ? Icons.keyboard_arrow_down
                            : Icons.keyboard_arrow_right,
                      ),
                      onPressed: () {
                        setState(() {
                          _mostraSigla[index] = !mostraSiglas;
                        });
                      },
                    ),
                    subtitle: mostraSiglas
                        ? Container(
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              code,
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : null,
                  ),
                );
              },
            ),
          )
        : const Center(
            child: Text('Nenhum país encontrado'),
          );
  }

  List? _filtraPais(String pais, List? paises, BuildContext context) {
    List<Map<String, dynamic>> filtro = [];

    for (var element in paises!) {
      if (element['name'] == pais) {
        filtro.add(element);
      }
    }

    return filtro.isEmpty ? paises : filtro;
  }
}
