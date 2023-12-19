// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/controller/cubits/loginCubit.dart';
import 'package:la_vie/controller/states/loginStates.dart';
import 'package:la_vie/share/components/Button.dart';
import 'package:la_vie/share/components/Divider.dart';
import 'package:la_vie/share/components/NavigateAndFinish.dart';
import 'package:la_vie/share/components/NavigateTo.dart';
import 'package:la_vie/share/components/OrContinueWith.dart';
import 'package:la_vie/share/components/TextButton.dart';
import 'package:la_vie/share/components/TextFormField.dart';
import 'package:la_vie/share/style/colors.dart';
import 'package:la_vie/view/forget%20password/forget_password_screen.dart';
import 'package:la_vie/view/layouts/layout_home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen(this.email,this.password,{super.key});
  TextEditingController email;
  TextEditingController password;
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {
        if(state is LoginSuccess){
          navigateAndFinish(context, LayoutHomeScreen());
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 10,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Email',
                        style: TextStyle(
                          color: defaultColorGrey6F,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      defaultTextFormField(
                        controll: email,
                        type: TextInputType.emailAddress,
                        validat: (String? value) {
                          if (value!.isEmpty) {
                            return 'Email mut be not empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Password',
                        style: TextStyle(
                          color: defaultColorGrey6F,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      defaultTextFormField(
                        controll: password,
                        type: TextInputType.text,
                        isPassword: cubit.isPassword,
                        suffix: cubit.suffix,
                        suffixPressed: () {
                          cubit.changePasswordVisibility();
                        },
                        validat: (String? value) {
                          if (value!.isEmpty) {
                            return 'Password mut be not empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      defaultButton(
                        function: () {
                          if(formKey.currentState!.validate()){
                            cubit.loginByApi(
                              email: email.text,
                              password: password.text,
                            );
                          }
                        },
                        color: defaultColorGreenHex,
                        text: 'Login',
                        width: double.infinity,
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: defaultTextButton(
                          function: () {
                            navigateto(context, const ForgetPasswordScreen());
                          },
                          text: 'Forget you password?',
                        ),
                      ),
                      orContinueWith(),
                    ],
                  ),
                ),
              ),
              Image.asset('assets/images/TracedDOWN.png'),
            ],
          ),
        );
      },
    );
  }
}
