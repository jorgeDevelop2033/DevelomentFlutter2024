import 'package:app_comercio/src/presentation/page/auth/registro/registroBlocCubit.dart';
import 'package:app_comercio/src/presentation/widgets/defaultButton.dart';
import 'package:app_comercio/src/presentation/widgets/default_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class registroPage extends StatefulWidget {
  const registroPage({super.key});

  @override
  State<registroPage> createState() => _registroPageState();
}

class _registroPageState extends State<registroPage> {
//referencia del cubit

  RegistroBlocCubit? _registroBlocCubit;

  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _registroBlocCubit?.Dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    _registroBlocCubit =
        BlocProvider.of<RegistroBlocCubit>(context, listen: false);

    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            //color: Colors.cyan,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  'assets/img/banner_form.jpg',
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.fill,
                  colorBlendMode: BlendMode.darken,
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.80,
                  width: MediaQuery.of(context).size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.3),
                      borderRadius: BorderRadius.all(Radius.circular(35))),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.grey,
                          size: 100,
                        ),
                        Text(
                          'Registro',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, right: 25),
                          child: StreamBuilder(
                              stream: _registroBlocCubit?.nombreStream,
                              builder: (context, snapshot) {
                                return default_textfield(
                                    label: 'Nombre',
                                    icon: Icons.person,
                                    errorText: snapshot.error?.toString(),
                                    onChanged: (text) {
                                      _registroBlocCubit?.changeName(text);
                                    });
                              }),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, right: 25),
                          child: StreamBuilder(
                              stream: _registroBlocCubit?.apellidoStream,
                              builder: (context, snapshot) {
                                return default_textfield(
                                    label: 'Apellido',
                                    icon: Icons.person,
                                    errorText: snapshot.error?.toString(),
                                    onChanged: (text) {
                                      _registroBlocCubit?.changeApellido(text);
                                    });
                              }),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, right: 25),
                          child: StreamBuilder(
                              stream: _registroBlocCubit?.emailStream,
                              builder: (context, snapshot) {
                                return default_textfield(
                                    label: 'Email',
                                    icon: Icons.email_sharp,
                                    errorText: snapshot.error?.toString(),
                                    onChanged: (text) {
                                      _registroBlocCubit?.changeEmail(text);
                                    });
                              }),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, right: 25),
                          child: StreamBuilder<Object>(
                              stream: _registroBlocCubit?.telefonoStream,
                              builder: (context, snapshot) {
                                return default_textfield(
                                    label: 'Telefono',
                                    icon: Icons.phone_android_rounded,
                                    errorText: snapshot.error?.toString(),
                                    onChanged: (text) {
                                      _registroBlocCubit?.changeTelefono(text);
                                    });
                              }),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, right: 25),
                          child: StreamBuilder(
                              stream: _registroBlocCubit?.passwordStream,
                              builder: (context, snapshot) {
                                return default_textfield(
                                    label: 'Constraseña',
                                    icon: Icons.lock,
                                    errorText: snapshot.error?.toString(),
                                    oCultarTexto: true,
                                    onChanged: (text) {
                                      _registroBlocCubit
                                          ?.changeContrasena(text);
                                    });
                              }),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 25, right: 25),
                          child: StreamBuilder(
                              stream: _registroBlocCubit
                                  ?.confirmacionPasswordStream,
                              builder: (context, snapshot) {
                                return default_textfield(
                                    label: 'Confirmar Constrasña',
                                    icon: Icons.lock_clock_outlined,
                                    errorText: snapshot.error?.toString(),
                                    onChanged: (text) {
                                      _registroBlocCubit
                                          ?.changeConfirmaContrasena(text);
                                    });
                              }),
                        ),
                        Container(
                            margin: EdgeInsets.only(
                                right: 25, top: 10, left: 25, bottom: 15),
                            child: StreamBuilder(
                                stream:
                                    _registroBlocCubit?.validacionFormulario,
                                builder: (context, snapshot) {
                                  return defaultButton(
                                    text: 'Registrarse',
                                    onPressed: () {
                                      if (snapshot.hasData) {
                                        _registroBlocCubit?.Register();
                                      } else {
                                        Fluttertoast.showToast(
                                            msg: 'formularioNo valido',
                                            toastLength: Toast.LENGTH_SHORT);
                                      }
                                    },
                                    color: Colors.green,
                                  );
                                })),
                        Container(
                            margin: EdgeInsets.only(
                                right: 25, top: 10, left: 25, bottom: 15),
                            child: defaultButton(
                              text: 'Cancelar',
                              onPressed: () {},
                              color: Colors.green,
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 30, top: 90),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.backspace_outlined,
                        size: 40,
                        color: Colors.white,
                      )),
                ),
              ],
            )));
  }
}
