import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchRandomDogImage() async {
  final response = await http.get(Uri.parse('https://dog.ceo/api/breeds/image/random'));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print('Ответ от API: $data');

    if (data['status'] == 'success') {
      return data['message'];
    } else {
      return 'Ошибка при получении изображения';
    }
  } else {
    throw Exception('Ошибка при запросе: ${response.statusCode}');
  }
}