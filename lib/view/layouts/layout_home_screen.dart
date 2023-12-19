import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/controller/cubits/layoutHomeCubit.dart';
import 'package:la_vie/controller/states/layoutHomeStates.dart';
import 'package:la_vie/share/style/colors.dart';

class LayoutHomeScreen extends StatelessWidget {
  LayoutHomeScreen({super.key});
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    var cubit = LayoutHomeCubit.get(context);
    return BlocConsumer<LayoutHomeCubit, LayoutHomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            key: _bottomNavigationKey,
            buttonBackgroundColor: defaultColorGreenHex,
            backgroundColor: defaultColorGrey,
            index: cubit.pageIndex,
            onTap: (index) {
              cubit.changePageIndex(index);
            },
            items: [
              Image.asset(
                'assets/images/leave.png',
                color: cubit.pageIndex != 0
                    ? defaultColorBlack
                    : defaultColorWhite,
              ),
              Image.asset(
                'assets/images/qr-code-scan.png',
                color: cubit.pageIndex != 1
                    ? defaultColorBlack
                    : defaultColorWhite,
              ),
              Image.asset(
                'assets/images/Home.png',
                color: cubit.pageIndex != 2
                    ? defaultColorBlack
                    : defaultColorWhite,
              ),
              Stack(
                alignment: AlignmentDirectional.topEnd,
                children: [
                  Image.asset(
                    'assets/images/Bell.png',
                    fit: BoxFit.cover,
                    color: cubit.pageIndex==3 ? defaultColorWhite : defaultColorBlack,
                  ),
                  Image.asset(
                    'assets/images/Ellipse 1843.png',
                    fit: BoxFit.cover,
                    color: cubit.pageIndex==3 ? defaultColorWhite : defaultColorGreenHex,
                  ),
                ],
              ),
              Image.asset(
                'assets/images/profile.png',
                color: cubit.pageIndex != 4
                    ? defaultColorBlack
                    : defaultColorWhite,
              ),
            ],
          ),
          body: Container(color: defaultColorWhite),
        );
      },
    );
  }
}
