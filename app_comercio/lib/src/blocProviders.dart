import 'package:app_comercio/injection.dart';
import 'package:app_comercio/src/domain/usecase/auth/AuthUseCases.dart';
import 'package:app_comercio/src/presentation/page/auth/login/loginBlocCubit.dart';
import 'package:app_comercio/src/presentation/page/auth/registro/registroBlocCubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

List<BlocProvider> blocProviders = [
  BlocProvider<loginBlocCubit>(
      create: (context) => loginBlocCubit(locator<AuthUseCases>())),
  BlocProvider<registroBlocCubit>(create: (context) => registroBlocCubit())
];
