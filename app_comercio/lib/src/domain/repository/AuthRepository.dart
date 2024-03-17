import 'package:app_comercio/src/domain/models/AuthResponse.dart';
import 'package:app_comercio/src/domain/models/Users.dart';
import 'package:app_comercio/src/utils/Resource.dart';

//INTERFACES
abstract class AuthRepository {
  Future<Resource<AuthResponse>> login(String userName, String password);
  Future<Resource<AuthResponse>> registrar(Users users, String token);
}
