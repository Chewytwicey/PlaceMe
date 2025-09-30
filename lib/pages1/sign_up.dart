import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(
            fontFamily: 'serif',
            fontSize: 20,
            color: Colors.black,
            letterSpacing: 10,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),

    );
  }
}
