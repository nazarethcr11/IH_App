import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData icon;

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          prefixIcon: Icon(icon , color: Colors.lightBlue.shade900,),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color:  Colors.grey.shade600,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2.0,
              color:  Colors.lightBlue.shade900,
            ),
            borderRadius: BorderRadius.circular(25),
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
          ),
        ),
        obscureText: obscureText,
      ),
    );
  }
}