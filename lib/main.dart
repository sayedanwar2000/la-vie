import 'package:flutter/material.dart';
import 'package:la_vie/controller/cubits/layoutHomeCubit.dart';
import 'package:la_vie/controller/cubits/loginCubit.dart';
import 'package:la_vie/controller/cubits/signupCubit.dart';
import 'package:la_vie/controller/states/loginStates.dart';
import 'package:la_vie/share/network/remote/dio_helper.dart';
import 'package:la_vie/share/style/colors.dart';
import 'package:la_vie/view/splash/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => SignupCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => LayoutHomeCubit(),
        ),
      ],
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: defaultColorGreen),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
