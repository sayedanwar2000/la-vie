import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/controller/states/signupStates.dart';
import 'package:la_vie/model/userModel.dart';
import 'package:la_vie/share/network/endpointer.dart';
import 'package:la_vie/share/network/remote/dio_helper.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit() : super(InitialSignup());

  static SignupCubit get(context) => BlocProvider.of(context);
  IconData suffix1 = Icons.visibility;
  IconData suffix2 = Icons.visibility;
  bool isPassword1 = true;
  bool isPassword2 = true;
  late UserModel user;
  String? messageError;

  void changePasswordVisibility1() {
    isPassword1 = !isPassword1;
    suffix1 = isPassword1 ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisbilityState());
  }
  void changePasswordVisibility2() {
    isPassword2 = !isPassword2;
    suffix2 = isPassword2 ? Icons.visibility : Icons.visibility_off;
    emit(ChangePasswordVisbilityState());
  }

  void signupByApi({
    required String fName,
    required String lName,
    required String email,
    required String password,
  }) {
    emit(SignupLoading());
    DioHelper.postData(
      url: Signup,
      data: {
        'firstName': fName,
        'lastName': lName,
        'email': email,
        'password': password
      },
    ).then((value) {
      print(value.data);
      // user = UserModel.fromJson(value.data);
      if (value.data['message'] != 'User created successfully') {
        print(1);
        messageError = value.data['message'][0];
        print(messageError);
        emit(SignupError());
      } else {
        user = UserModel.fromJson(value.data);
        emit(SignupSuccess());
      }
    }).catchError((error) {
      print(error.toString());
      messageError = error.toString();
      emit(SignupError());
    });
  }
}