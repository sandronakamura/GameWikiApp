import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:game_wiki_app/firebase_options.dart';
import 'package:game_wiki_app/view/authentication_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:game_wiki_app/view/home_screen.dart';
import 'package:game_wiki_app/view/splash_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Wiki App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => const SplashScreen(),
        AuthScreen.id: (context) => const AuthScreen(),
        HomeScreen.id: (context) => const HomeScreen()
      },
    );
  }
}






