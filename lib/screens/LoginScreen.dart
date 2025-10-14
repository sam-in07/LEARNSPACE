import 'package:flutter/material.dart';

class login  extends StatefulWidget {
  const login ({super.key});

  @override
  State<login > createState() => _loginState();
}

class _loginState extends State<login > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
          child: Text("Login page loading "),
       ),
    );
  }
}
