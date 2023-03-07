import 'package:flutter/material.dart';

class RoundedTextField extends StatefulWidget {
  const RoundedTextField({super.key, required this.text, required this.optionObscure,  required this.controller, required this.icon});
  final bool icon;
  final String text;
  final bool optionObscure;
  final TextEditingController controller;

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  bool _obscureText = true;
  @override
  void initState() {
    _obscureText = widget.optionObscure;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: TextField(
                cursorColor: Colors.black,
                obscureText: _obscureText,
                style: const TextStyle(
                  color: Colors.black
                ),

                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  labelText: widget.text,
                  filled: true,
                  fillColor: Colors.white,
                  suffixIcon: widget.icon ?

                  IconButton(
                      icon: Icon(
                          (_obscureText) ? Icons.visibility_off : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      }) : null

                ),
                controller: widget.controller,
              ),
    );
  }
}