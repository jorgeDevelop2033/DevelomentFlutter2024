import 'dart:convert';
import 'dart:io';

import 'package:app_comercio/src/domain/models/AuthResponse.dart';
import 'package:app_comercio/src/domain/models/Users.dart';
import 'package:http/http.dart' as http;
import 'package:app_comercio/src/utils/Resource.dart';

class AuthService {
  Future<Resource<AuthResponse>> login(String userName, String password) async {
    try {
      Uri url = Uri(
          scheme: 'http',
          host: '192.168.10.38',
          port: 5245,
          path: '/api/Users/Authenticate');
      print(url);
      Map<String, String> headers = {"Content-Type": "application/json"};

      String body = json.encode({'userName': userName, 'password': password});

      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse.fromJson(data);
        print(authResponse.data.token);
        return Succes(authResponse);
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
    return Error('');
  }

  Future<Resource<AuthResponse>> register(Users users, String token) async {
    try {
      Uri url = Uri(
          scheme: 'http',
          host: '192.168.10.38',
          port: 5245,
          path: '/api/Users/InsertUsers');
      print(url);
      Map<String, String> headers = {"Content-Type": "application/json"};

      String body = json.encode({
        'firstName': users.firstName,
        'lastName': users.lastName,
        'password': users.password,
        'userName': users.userName
      });

      final response = await http.post(url, headers: headers, body: body);
      //final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        AuthResponse authResponse = AuthResponse(
            data: users, isSuccess: true, message: 'Existo Registro');

        print(authResponse.data.token);
        return Succes(authResponse);
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
    return Error('');
  }
}
