part of 'auth_cubit.dart';

abstract class AuthState  {}

class AuthInitial extends AuthState {}

class AuthVisible extends AuthState {}
class AuthCheck extends AuthState {}
class AuthVisible1 extends AuthState {}
class AuthCheck1 extends AuthState {}

class LoadingAddUserState extends AuthState {}
class SuccessAddUserState extends AuthState {}
class ErrorAddUserState extends AuthState {}

class LoadingLoginUserState extends AuthState {}
class SuccessLoginUserState extends AuthState {}
class ErrorLoginUserState extends AuthState {}

class LoadingResetState extends AuthState {}
class SuccessResetState extends AuthState {}
class ErrorResetState extends AuthState {}



