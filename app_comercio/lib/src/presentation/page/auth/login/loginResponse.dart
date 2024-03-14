import 'package:app_comercio/injection.dart';
import 'package:app_comercio/src/domain/usecase/auth/AuthUseCases.dart';
import 'package:app_comercio/src/presentation/page/auth/login/loginBlocCubit.dart';
import 'package:app_comercio/src/utils/Resource.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginResponse extends StatelessWidget {
  final loginBlocCubit bloc = loginBlocCubit(locator<AuthUseCases>());

  LoginResponse(bloc, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: bloc?.responseStream,
        builder: ((context, snapshot) {
          final state = snapshot.data;
          if (state is Loading) {
            Center(child: CircularProgressIndicator(color: Colors.red));
          } else if (state is Succes) {
            Fluttertoast.showToast(
                msg: 'Exito Ingreso', toastLength: Toast.LENGTH_SHORT);
          } else if (state is Error) {
            Fluttertoast.showToast(
                msg: state.message, toastLength: Toast.LENGTH_SHORT);
          }

          return Container();
        }));
  }
}
