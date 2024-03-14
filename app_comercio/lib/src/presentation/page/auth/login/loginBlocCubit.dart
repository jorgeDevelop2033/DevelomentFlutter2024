import 'package:app_comercio/src/domain/usecase/auth/AuthUseCases.dart';
import 'package:app_comercio/src/presentation/page/auth/login/loginBlocState.dart';
import 'package:app_comercio/src/utils/Resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class loginBlocCubit extends Cubit<loginBlocState> {
  AuthUseCases authUseCases;
  loginBlocCubit(this.authUseCases) : super(loginInitial());

  //LoginUseCase loginUseCase = LoginUseCase();

  final _responseController = BehaviorSubject<Resource>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<Resource> get responseStream => _responseController;

  void changeEmail(String email) {
    if (email.isNotEmpty && email.length < 6) {
      _emailController.sink
          .addError('longitud de caracteres debe ser mayor a 6');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changePassword(String password) {
    if (password.isNotEmpty && password.length < 6) {
      _passwordController.sink.addError('longitud menor a 6 caracteres');
    } else {
      _passwordController.sink.add(password);
    }
  }

  void login() async {
    _responseController.add(Loading());

    print('Email ==> ${_emailController.value}');
    print('PassWord ==> ${_passwordController.value}');

    Resource response = await authUseCases.login
        .run(_emailController.value, _passwordController.value);
    _responseController.add(response);
    Future.delayed(Duration(seconds: 1), () {
      _responseController.add(Initial());
    });
  }

//combina dos string
//si pasa la dos validaciones el formulario es valido (true)
  Stream<bool> get validateForm =>
      Rx.combineLatest2(emailStream, passwordStream, (a, b) => true);

//Ejecutar cuando se pase a otra pantalla,
  void Dispose() {
    changeEmail('');
    changePassword('');
  }
}
