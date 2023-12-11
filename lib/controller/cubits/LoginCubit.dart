import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/controller/states/LoginStates.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLogin());

  static LoginCubit get(context) => BlocProvider.of(context);
  IconData suffix = Icons.visibility;
  bool isPassword = true;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisbilityState());
  }
}
