import 'package:flutter/material.dart';
import 'package:learnsphere/widgets/customer_text_feild.dart';

class login  extends StatefulWidget {
  const login ({super.key});

  @override
  State<login > createState() => _loginState();
}

class _loginState extends State<login > {

  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();

    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {

    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
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
                width: width * 0.5,
                height: height * 0.3,
                child: Image.asset(
                  'assets/images/lrm_sm.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: height * 0.025),


              CustomerTextField(
                controller: _emailController,
                labelText: 'Email Address',
                hintText: 'Enter your email',

              ),

              const SizedBox(height: 24.0),

              CustomerTextField(
                controller: _passwordController,
                labelText: 'Password',
                hintText: 'Enter your password',
                isPassword: true,
              ),

            ],
          ),
       ),
    );
  }
}
