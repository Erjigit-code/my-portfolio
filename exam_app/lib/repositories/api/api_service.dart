import 'package:http/http.dart' as http;
import 'dart:convert';

class CategoryMealsApi {
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/058729bd-1402-4578-88de-265481fd7d54'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['сategories'];
    } else {
      throw Exception('Failed to load data');
    }
  }
}

class MealsNamesApi {
  Future<List<dynamic>> fetchData() async {
    final response = await http.get(Uri.parse(
        'https://run.mocky.io/v3/aba7ecaa-0a70-453b-b62d-0e326c859b3b'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['dishes'];
    } else {
      throw Exception('Failed to load Meals');
    }
  }
}
