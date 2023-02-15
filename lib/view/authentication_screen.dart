
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:game_wiki_app/widgets/rounded_textfield.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  static String id = "auth_screen";

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Game Wiki App'),
            
            RoudedButton(text: "E-mail", optionObscure: false),
            RoudedButton(text: "Senha", optionObscure: true),

            TextButton(onPressed: () {
            
            }, 
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
}