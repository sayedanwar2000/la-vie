import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/controller/states/LoginStates.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLogin());

  static LoginCubit get(context) => BlocProvider.of(context);
}
