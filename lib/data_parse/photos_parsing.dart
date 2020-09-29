import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_project/data/photos_data.dart';

Future<List<Photos>> fetch() async {
  var response = await http.get(
      'https://api.unsplash.com/photos/?client_id=cf49c08b444ff4cb9e4d126b7e9f7513ba1ee58de7906e4360afc1a33d1bf4c0');
  if (response.statusCode == 200) {
    final parsed = jsonDecode(response.body);
    return parsed.map<Photos>((json) => Photos.fromJson(json)).toList();
  } else {
    print('something wrong');
    print(response.statusCode);
    return [];
  }
}
