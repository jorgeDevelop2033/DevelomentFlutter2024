import 'package:app_comercio/src/presentation/page/auth/login/loginBlocCubit.dart';
import 'package:app_comercio/src/presentation/page/auth/login/loginContent.dart';
import 'package:app_comercio/src/presentation/page/auth/login/loginResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _loginPageState();
}

class _loginPageState extends State<LoginPage> {
  loginBlocCubit? _loginCubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('ININICALIZANDO LA PANTALLA LOGIN');

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _loginCubit?.Dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    _loginCubit = BlocProvider.of<loginBlocCubit>(context, listen: false);

    return Scaffold(
        body: Container(
            width: double.infinity,
            child: Stack(alignment: Alignment.center, children: [
              LoginResponse(_loginCubit),
              loginContent(_loginCubit)
            ])));
  }
}
