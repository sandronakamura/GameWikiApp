import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:game_wiki_app/view/home_screen.dart';
// ignore: depend_on_referenced_packages
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'authentication_screen.dart';

class SplashScreen extends StatefulWidget {

  const SplashScreen({Key? key}) : super(key: key);
  static String id = "splash_screen";

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLogged = true;

  void enable(bool value) {
    if (mounted) {
      setState(() => _isLogged = !value);
    }
  }

  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    VerifyUser();
  }
  @override
  Widget build(BuildContext context) {

    return AnimatedSplashScreen(
      splash: Column(
        children: [
          Image.asset('assets/GameWikiLogo.jpg')
        ],
      ),
      nextScreen: _isLogged == false ? AuthScreen() : HomeScreen(),
      splashIconSize: 475,
      backgroundColor: Colors.black,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.fade,
      animationDuration: const Duration(seconds: 1),
    );


  }
  // ignore: non_constant_identifier_names
  VerifyUser() async{

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('Usuário deslogado');
        enable(true);
      } else {
        print('Usuário logado');
        enable(false);
      }
    });
  }
}