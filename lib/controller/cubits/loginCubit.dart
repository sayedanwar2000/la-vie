import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/controller/states/loginStates.dart';
import 'package:la_vie/model/userModel.dart';
import 'package:la_vie/share/network/endpointer.dart';
import 'package:la_vie/share/network/remote/dio_helper.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLogin());

  static LoginCubit get(context) => BlocProvider.of(context);
  IconData suffix = Icons.visibility;
  bool isPassword = true;
  late UserModel user;
  String? messageError;

  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix = isPassword ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisbilityState());
  }

  void loginByApi({
    required String email,
    required String password,
  }) {
    emit(LoginLoading());
    DioHelper.postData(
      url: Login,
      data: {
        'email': email,
        'password': password,
      },
    ).then((value) {
      print(value.data);
      if (value.data['message'] == 'Incorrect Email or Password') {
        messageError = value.data['message'];
        print(messageError);
        emit(LoginError());
      } else {
        user = UserModel.fromJson(value.data);
        emit(LoginSuccess());
      }
    }).catchError((error) {
      print(error.toString());
      messageError = error.toString();
      emit(LoginError());
    });
  }
}
