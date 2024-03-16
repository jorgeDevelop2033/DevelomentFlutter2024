import 'package:app_comercio/src/domain/usecase/auth/LoginUseCase.dart';
import 'package:app_comercio/src/domain/usecase/auth/RegistroUseCase.dart';
import 'package:injectable/injectable.dart';

class AuthUseCases {
  LoginUseCase login;
  RegistroUseCase registrar;

  AuthUseCases({required this.login, required this.registrar});
}
