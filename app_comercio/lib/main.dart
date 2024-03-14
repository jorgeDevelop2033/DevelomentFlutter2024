import 'package:app_comercio/injection.dart';
import 'package:app_comercio/src/blocProviders.dart';
import 'package:app_comercio/src/presentation/page/auth/login/loginPage.dart';
import 'package:app_comercio/src/presentation/page/auth/registro/registroPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: blocProviders,
      child: MaterialApp(
        builder: FToastBuilder(),
        debugShowCheckedModeBanner: false,
        title: 'Incio Login Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: 'login',
        routes: {
          'login': (BuildContext context) => loginPage(),
          'registro': (BuildContext context) => registroPage()
        },
      ),
    );
  }
}
