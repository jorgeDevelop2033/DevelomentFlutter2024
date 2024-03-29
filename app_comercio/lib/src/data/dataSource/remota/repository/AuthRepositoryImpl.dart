import 'package:app_comercio/src/data/dataSource/services/AuthService.dart';
import 'package:app_comercio/src/domain/models/Users.dart';
import 'package:app_comercio/src/domain/repository/AuthRepository.dart';
import 'package:app_comercio/src/utils/Resource.dart';

class AuthRepositoryImpl implements AuthRepository {
  //AuthService authService = AuthService();

  AuthService authService;
  AuthRepositoryImpl(this.authService);

  @override
  Future<Resource> login(String userName, String password) {
    return authService.login(userName, password);
  }

  @override
  Future<Resource> registrar(Users users) {
    // TODO: implement registrar
    throw UnimplementedError();
  }
}
