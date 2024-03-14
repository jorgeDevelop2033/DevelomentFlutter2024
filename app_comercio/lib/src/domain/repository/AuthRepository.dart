import 'package:app_comercio/src/domain/models/Users.dart';
import 'package:app_comercio/src/utils/Resource.dart';

//INTERFACES
abstract class AuthRepository {
  Future<Resource> login(String userName, String password);
  Future<Resource> registrar(Users users);
}
