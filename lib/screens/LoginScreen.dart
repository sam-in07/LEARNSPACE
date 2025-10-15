import 'package:flutter/material.dart';

class login  extends StatefulWidget {
  const login ({super.key});

  @override
  State<login > createState() => _loginState();
}

class _loginState extends State<login > {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;
    final size = MediaQuery.of(context).size;
    return Scaffold(
       body: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.3,
                height: height * 0.20,
                child: Image.asset(
                  'assets/images/lrm_sm.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: height * 0.04),
              Text(
                "Email where "
              ),

            ],
          ),
       ),
    );
  }
}
