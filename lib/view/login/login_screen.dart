import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/controller/cubits/LoginCubit.dart';
import 'package:la_vie/controller/states/LoginStates.dart';
import 'package:la_vie/share/components/Divider.dart';
import 'package:la_vie/share/components/NavigateTo.dart';
import 'package:la_vie/share/components/OrContinueWith.dart';
import 'package:la_vie/share/components/TextButton.dart';
import 'package:la_vie/share/components/TextFormField.dart';
import 'package:la_vie/share/style/colors.dart';
import 'package:la_vie/view/forget%20password/forget_password_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    var cubit = LoginCubit.get(context);
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
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
                  height: 20,
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
                  type: TextInputType.emailAddress,
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
        );
      },
    );
  }
}
