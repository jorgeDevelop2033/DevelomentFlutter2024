import 'package:app_comercio/src/data/dataSource/remota/repository/AuthRepositoryImpl.dart';
import 'package:app_comercio/src/data/dataSource/services/AuthService.dart';
import 'package:app_comercio/src/domain/repository/AuthRepository.dart';
import 'package:app_comercio/src/domain/usecase/auth/AuthUseCases.dart';
import 'package:app_comercio/src/domain/usecase/auth/LoginUseCase.dart';
import 'package:app_comercio/src/domain/usecase/auth/RegistroUseCase.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  AuthService get authService => AuthService();

  @injectable
  AuthRepository get autRepository => AuthRepositoryImpl(authService);

  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
      login: LoginUseCase(autRepository),
      registrar: RegistroUseCase(autRepository));
}
