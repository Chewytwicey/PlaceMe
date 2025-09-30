import 'package:flutter/material.dart';
import 'dup_register.dart';
import 'login_page.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool showLoginPage = true;
  void togglepages() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }


  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginScreen(onTap: togglepages);
    } else {
      return RegisterPage1(onTap: togglepages);
    }
  }
}
