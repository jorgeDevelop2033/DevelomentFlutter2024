import 'package:app_comercio/src/presentation/page/auth/login/loginBlocCubit.dart';
import 'package:app_comercio/src/presentation/widgets/default_textfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class loginContent extends StatelessWidget {
  loginBlocCubit? bloc;
  loginContent(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Image.asset(
        'assets/img/background1.jpg',
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        fit: BoxFit.cover,
        color: Colors.black38,
        colorBlendMode: BlendMode.darken,
      ),
      Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.3),
            borderRadius: BorderRadius.all(Radius.circular(25))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: Colors.blueAccent,
              size: 130,
            ),
            Text(
              'LOGIN',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              child: StreamBuilder<Object>(
                  stream: bloc?.emailStream,
                  builder: (context, snapshot) {
                    return default_textfield(
                        label: 'Correo Electronico',
                        icon: Icons.email,
                        errorText: snapshot.error?.toString(),
                        onChanged: (text) {
                          print('Texto: ${text}');
                          bloc?.changeEmail(text);
                        });
                  }),
            ),
            Container(
              margin: EdgeInsets.only(left: 25, right: 25),
              child: StreamBuilder(
                  stream: bloc?.passwordStream,
                  builder: (context, snapshot) {
                    return default_textfield(
                        label: 'Contraseña',
                        icon: Icons.lock,
                        errorText: snapshot.error?.toString(),
                        oCultarTexto: true,
                        onChanged: (text) {
                          print('Texto Contraseña: ${text}');
                          bloc?.changePassword(text);
                        });
                  }),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: 25, top: 20, left: 25, bottom: 25),
              child: StreamBuilder(
                  stream: bloc?.validateForm,
                  builder: (context, snapshot) {
                    return ElevatedButton(
                      onPressed: () {
                        if (snapshot.hasData) {
                          bloc?.login();
                        } else {
                          print('Info NO Valida');
                          Fluttertoast.showToast(
                              msg: 'Formulario No Valido!',
                              toastLength: Toast.LENGTH_SHORT);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: Text('Iniciar Session',
                          style: TextStyle(color: Colors.black)),
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 60,
                  height: 1,
                  color: Colors.white,
                  margin: EdgeInsets.only(right: 5),
                ),
                Text(
                  'No tienes Cuenta?',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Container(
                  width: 60,
                  height: 1,
                  color: Colors.white,
                  margin: EdgeInsets.only(left: 5),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(right: 25, top: 10, left: 25, bottom: 15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'registro');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange),
                child:
                    Text('Registrate', style: TextStyle(color: Colors.black)),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}
