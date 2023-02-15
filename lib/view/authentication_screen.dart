

import 'dart:js';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_wiki_app/view/home_screen.dart';
import 'package:game_wiki_app/widgets/rounded_textfield.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});
  static String id = "auth_screen";



  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
          children: [
            Text('Game Wiki App'),

            RoudedButton(text: "E-mail", optionObscure: false, controller: _emailController),
            RoudedButton(text: "Senha", optionObscure: true, controller: _passwordController),

            TextButton(onPressed: authentication,
            child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
              ),
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80)
            ),
            )
          ],
          )
          )
        )
      ),
    );
  }
  authentication() async{
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);

      if(userCredential != null) {
        Navigator.pushReplacement(
            context as BuildContext,
            MaterialPageRoute(builder: (context) => const HomeScreen())
        );

      }
    } on FirebaseException catch(e){
      print(e.code);
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(
          const SnackBar(
              content: Text(
                  'Usuário não encontrado',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20
                ),
              ),
          ),
        );
      } else if (e.code == 'wrong-password' || e.code == 'invalid-email') {
        ScaffoldMessenger.of(context as BuildContext).showSnackBar(
          const SnackBar(
              content: Text(
                  'Usuário ou Senha Incorretos',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20
                  ),
              )
          ),
        );
      }
    }
  }
}