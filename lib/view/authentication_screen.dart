import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:game_wiki_app/view/home_screen.dart';
import 'package:game_wiki_app/view/registration_screen.dart';
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
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                width: 250,
                child: Image.asset(
                    'assets/GameWikiLogo.jpg'
                )),

            RoundedTextField(
                text: "E-mail",
                optionObscure: false,
                controller: _emailController,
                icon: false,
            ),
            RoundedTextField(
                text: "Senha",
                optionObscure: true,
                controller: _passwordController,
                icon: true,
            ),
            TextButton(
              onPressed: authentication,
            style: TextButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(vertical: 16, horizontal: 80)
            ),
              child: const Text(
              "Login",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16
              ),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const RegistrationScreen()),
                  );
                },
                child: const Text(
                    'Criar uma nova conta',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                )
            ),
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
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen())
        );

      }
    } on FirebaseException catch(e){
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context).showSnackBar(
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