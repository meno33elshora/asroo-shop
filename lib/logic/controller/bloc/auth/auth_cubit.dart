import 'package:asroo/services/Firebase%20Unit/firebase_auth.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  bool isVisible = true;
  bool isVisible1 = true;
  bool isCheck = false;
  bool isCheck1 = false;

  void changeVisible() {
    isVisible = !isVisible;
    emit(AuthVisible());
  }
  void changeVisible1() {
    isVisible1 = !isVisible1;
    emit(AuthVisible1());
  }

  void changeCheck() {
    isCheck = !isCheck;
    emit(AuthCheck());
  }
  void changeCheck1() {
    isCheck1 = !isCheck1;
    emit(AuthCheck1());
  }

  Future<void> addUserAccount({
    required String user,
    required String email,
    required String password,
  }) async {
    emit(LoadingAddUserState());
    AuthUserAccount()
        .addUserAccount(emailAddress: email, password: password, name: user)
        .then((value) {
      emit(SuccessAddUserState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorAddUserState());
    });
  }

  Future<void> loginUserAccount({
    required String email,
    required String password,
  }) async {
    emit(LoadingLoginUserState());
    AuthUserAccount()
        .loginUser(emailAddress: email, password: password,)
        .then((value) {
      emit(SuccessLoginUserState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorLoginUserState());
    });
  }

  Future<void> resetEmailAccount({
    required String email,
  }) async {
    emit(LoadingResetState());
    AuthUserAccount()
        .resetUser( email: email,)
        .then((value) {
      emit(SuccessResetState());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorResetState());
    });
  }
}
