import 'package:app_comercio/src/domain/repository/AuthRepository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class LoginUseCase {
  AuthRepository repository;

  LoginUseCase(this.repository);

  run(String userName, String password) => repository.login(userName, password);
}
