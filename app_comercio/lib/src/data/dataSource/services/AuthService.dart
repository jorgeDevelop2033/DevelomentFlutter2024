import 'dart:convert';

import 'package:app_comercio/src/domain/models/AuthResponse.dart';
import 'package:http/http.dart' as http;
import 'package:app_comercio/src/utils/Resource.dart';

class AuthService {
  Future<Resource> login(String userName, String password) async {
    try {
      Uri url = Uri.http('', '/../.');
      Map<String, String> headers = {"Content-Type": "application/json"};

      String body = json.encode({'userName': userName, 'password': password});

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        return Succes(authResponse);
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
    return Error('');
  }
}
