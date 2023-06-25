import 'dart:convert';
import 'package:http/http.dart' as http;

class Requisicao {
  static Future<List> requisicaoPaises() async {
    Map paises = {};
    String apiUrl = 'http://api.nobelprize.org/v1/country.json';

    http.Response response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      paises = json.decode(response.body);

      return paises.values.first;

    } else {
      throw Exception('Falha ao carregar os países');
    }
  }
}
