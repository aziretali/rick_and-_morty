import 'dart:convert';

import 'package:rick_and_morty2/data/models/character.dart';
import 'package:http/http.dart' as http;

class CharacterRepo {
  final url = 'https://rickandmortyapi.com/api/character';

  Future<Character> getCharacter(int page, String name) async {
    try {
      var responce = await http.get(Uri.parse(url + '?page=$page&name=$name'));

      var jsonResult = json.decode(responce.body);
      return Character.fromJson(jsonResult);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
