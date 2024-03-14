import 'package:app_comercio/src/presentation/page/auth/registro/registroBlocState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class registroBlocCubit extends Cubit<registroBlocState> {
  registroBlocCubit() : super(registroInitial());

  final _nombreController = BehaviorSubject<String>();
  final _apellidoController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _telefonoController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmacionPasswordController = BehaviorSubject<String>();

  Stream<String> get nombreStream => _nombreController.stream;
  Stream<String> get apellidoStream => _apellidoController.stream;
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get telefonoStream => _telefonoController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  Stream<String> get confirmacionPasswordStream =>
      _confirmacionPasswordController.stream;

  void changeName(String nombre) {
    if (nombre.isNotEmpty && nombre.length < 2) {
      _nombreController.sink.addError('Nombre le faltan agregar Caracteres');
    } else {
      _nombreController.sink.add(nombre);
    }
  }

  void changeApellido(String apellido) {
    if (apellido.isNotEmpty && apellido.length < 2) {
      _apellidoController.sink.addError('Nombre le faltan agregar Caracteres');
    } else {
      _apellidoController.sink.add(apellido);
    }
  }

  void changeEmail(String email) {
    bool emailFormatValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    if (email.isNotEmpty && email.isNotEmpty && email.length < 5) {
      _emailController.sink.addError('Al menos 5 caracteres');
    } else if (email.isNotEmpty && !emailFormatValid) {
      _emailController.sink.addError('El email no es valido');
    } else {
      _emailController.sink.add(email);
    }
  }

  void changeTelefono(String telefono) {
    if (telefono.isNotEmpty && telefono.length < 2) {
      _telefonoController.sink.addError('Nombre le faltan agregar Caracteres');
    } else {
      _telefonoController.sink.add(telefono);
    }
  }

  void changeContrasena(String password) {
    if (password.isNotEmpty && password.length < 2) {
      _passwordController.sink.addError('Nombre le faltan agregar Caracteres');
    } else {
      _passwordController.sink.add(password);
    }
  }

  void changeConfirmaContrasena(String confirmaContrasena) {
    if (confirmaContrasena.isNotEmpty && confirmaContrasena.length < 2) {
      _confirmacionPasswordController.sink
          .addError('Nombre le faltan agregar Caracteres');
    } else if (_passwordController.value != confirmaContrasena) {
      _confirmacionPasswordController.sink
          .addError('Contraseñas no coincide.!');
    } else {
      _confirmacionPasswordController.sink.add(confirmaContrasena);
    }
  }

  Stream<bool> get validacionFormulario => Rx.combineLatest6(
      nombreStream,
      apellidoStream,
      emailStream,
      telefonoStream,
      passwordStream,
      confirmacionPasswordStream,
      (a, b, c, d, e, f) => true);

  void Register() {
    print('Nombre: => ${_nombreController.value}');
    print('Apellido: => ${_apellidoController.value}');
    print('Email: => ${_emailController.value}');
    print('Telefono: => ${_telefonoController.value}');
    print('Password: => ${_passwordController.value}');
    print('ConfirmPassword: => ${_confirmacionPasswordController.value}');
  }

  void Dispose() {
    changeName('');
    changeApellido('');
    changeEmail('');
    changeTelefono('');
    changeContrasena('');
    changeConfirmaContrasena('');
  }
}
