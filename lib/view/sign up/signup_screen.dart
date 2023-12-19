// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/controller/cubits/signupCubit.dart';
import 'package:la_vie/controller/states/signupStates.dart';
import 'package:la_vie/share/components/Button.dart';
import 'package:la_vie/share/components/OrContinueWith.dart';
import 'package:la_vie/share/components/TextFormField.dart';
import 'package:la_vie/share/style/colors.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen(
      this.fName,
      this.lName,
      this.email,
      this.password,
      this.confirmPassword,
      {super.key}
      );

  TextEditingController fName;
  TextEditingController lName;
  TextEditingController email;
  TextEditingController password;
  TextEditingController confirmPassword;
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var cubit = SignupCubit.get(context);
    return BlocConsumer<SignupCubit, SignupStates>(
      listener: (context, state) {},
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
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'First Name',
                                  style: TextStyle(
                                    color: defaultColorGrey6F,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                defaultTextFormField(
                                  controll: fName,
                                  type: TextInputType.text,
                                  validat: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'First name must be not empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Last Name',
                                  style: TextStyle(
                                    color: defaultColorGrey6F,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                defaultTextFormField(
                                  controll: lName,
                                  type: TextInputType.text,
                                  validat: (String? value) {
                                    if (value!.isEmpty) {
                                      return 'Last name must be not empty';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
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
                            return 'Email must be not empty';
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
                        isPassword: cubit.isPassword1,
                        suffix: cubit.suffix1,
                        suffixPressed: () {
                          cubit.changePasswordVisibility1();
                        },
                        validat: (String? value) {
                          if (value!.isEmpty) {
                            return 'Password must be not empty';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Confirm Password',
                        style: TextStyle(
                          color: defaultColorGrey6F,
                          fontFamily: 'Roboto',
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      defaultTextFormField(
                        controll: confirmPassword,
                        type: TextInputType.text,
                        isPassword: cubit.isPassword2,
                        suffix: cubit.suffix2,
                        suffixPressed: () {
                          cubit.changePasswordVisibility2();
                        },
                        validat: (String? value) {
                          if (value!.isEmpty) {
                            return 'Confirm password must be not empty';
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
                          if (formKey.currentState!.validate()) {
                            cubit.signupByApi(
                              email: email.text,
                              password: password.text,
                              fName: fName.text,
                              lName: lName.text,
                            );
                          }
                        },
                        color: defaultColorGreenHex,
                        text: 'Signup',
                        width: double.infinity,
                      ),
                      const SizedBox(
                        height: 15,
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
