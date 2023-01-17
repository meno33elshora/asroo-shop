import 'package:asroo/logic/controller/bloc/app/app_cubit.dart';
import 'package:asroo/logic/controller/bloc/auth/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBinding {
static  AuthCubit getAuth(context) => BlocProvider.of<AuthCubit>(context);
static  AppCubit getApp(context) => BlocProvider.of<AppCubit>(context);
}
