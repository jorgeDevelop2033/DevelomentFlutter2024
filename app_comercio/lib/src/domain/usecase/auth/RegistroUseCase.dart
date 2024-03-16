import 'package:app_comercio/src/domain/models/Users.dart';
import 'package:app_comercio/src/domain/repository/AuthRepository.dart';
import 'package:injectable/injectable.dart';

@Injectable()
class RegistroUseCase {
  AuthRepository repository;

  RegistroUseCase(this.repository);

  run(Users users) => repository.registrar(users);
}
