import 'package:flutter/material.dart';
import 'package:la_vie/share/components/LogoLaVie.dart';
import 'package:la_vie/share/style/colors.dart';
import 'package:la_vie/view/login/login_screen.dart';
import 'package:la_vie/view/sign%20up/signup_screen.dart';

class LayoutStartScreen extends StatelessWidget {
  LayoutStartScreen({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController signupEmail = TextEditingController();
  TextEditingController signupPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: defaultColorWhite,
        body: DefaultTabController(
          length: 2,
          initialIndex: 1,
          child: SizedBox(
            height: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  left: width * 0.65,
                  child: Image.asset('assets/images/TracedUP.png'),
                ),
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.2,
                      ),
                      logoLaVie(
                        fontSize: 27,
                        left: width * 0.1,
                        top: height * 0.006,
                        width: 23,
                        height: 15.04,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 75,
                        child: AppBar(
                          backgroundColor: defaultColorWhite,
                          elevation: 0,
                          bottom: TabBar(
                            unselectedLabelColor: defaultColorGrey,
                            dividerColor: defaultColorTransparent,
                            indicatorSize: TabBarIndicatorSize.label,
                            labelStyle: const TextStyle(
                              fontFamily: 'Roboto',
                            ),
                            tabs: const [
                              Tab(
                                text: 'Sign up',
                              ),
                              Tab(
                                text: 'Login',
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            SignupScreen(
                              fName,
                              lName,
                              signupEmail,
                              signupPassword,
                              confirmPassword,
                            ),
                            LoginScreen(email, password),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                /*SizedBox(
                  height: 50,
                ),
                AppBar(
                  bottom: TabBar(tabs: [
                    Tab(
                      text: 'Sign up',
                    ),
                    Tab(
                      text: 'Login',
                    ),
                  ],),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
