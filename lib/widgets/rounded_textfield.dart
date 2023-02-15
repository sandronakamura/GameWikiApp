import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RoudedButton extends StatelessWidget {
  const RoudedButton({super.key, required this.text, required this.optionObscure,  required this.controller});

  final String text;
  final bool optionObscure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
                obscureText: optionObscure,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(300)),
                  labelText: "$text"
                ),
                controller: controller,
              ),
    );
  }
}