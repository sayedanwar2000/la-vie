import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/controller/states/layoutHomeStates.dart';

class LayoutHomeCubit extends Cubit<LayoutHomeStates> {
  LayoutHomeCubit() : super(InitialLayout());

  static LayoutHomeCubit get(context) => BlocProvider.of(context);
  int pageIndex = 3;

  void changePageIndex(index) {
    pageIndex = index;
    emit(ChangePageIndex());
  }
}
