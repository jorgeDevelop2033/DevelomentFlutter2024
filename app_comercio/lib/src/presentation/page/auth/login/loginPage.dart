import 'package:app_comercio/src/presentation/page/auth/login/loginBlocCubit.dart';
import 'package:app_comercio/src/presentation/page/auth/login/loginContent.dart';
import 'package:app_comercio/src/presentation/page/auth/login/loginResponse.dart';
import 'package:app_comercio/src/presentation/widgets/default_textfield.dart';
import 'package:app_comercio/src/utils/Resource.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
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
