import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


void postAPICallingFamily(Map<String, dynamic> requestBody) async {

  final response = await http.post(
    Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(requestBody),
  );

  if (response.statusCode == 201) {
    // Request successful
    final jsonData = jsonDecode(response.body);
    // TODO: Handle the response data as needed
    print(jsonData);
  } else {
    // Request failed
    throw Exception('Failed to make API call');
  }
}