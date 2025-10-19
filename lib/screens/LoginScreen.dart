import 'package:flutter/material.dart';
import 'package:learnsphere/screens/MainScreen.dart';
import 'package:learnsphere/screens/RegistrationScreen.dart';
import 'package:learnsphere/widgets/app_text_style.dart';
import 'package:learnsphere/widgets/colors.dart';
import 'package:learnsphere/widgets/customer_text_feild.dart';
import 'package:learnsphere/widgets/primary_button.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
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

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('created account sucessfully')));
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => Mainscreen()));
    }
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final width = mediaQuery.size.width;
    final height = mediaQuery.size.height;
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.7,
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

              SizedBox(height: height * 0.07),
              //forgot password
              Padding(
                padding: const EdgeInsets.only(right: 46.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      // Action when tapped
                    },
                    child: const Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

              //login button
              SizedBox(height: height * 0.04),
              PrimaryButton(
                height: 55,
                width: 346,
                radius: 5.5,
                color: AppColors.primaryColor,
                title: 'Login',
                textStyle: AppTextstyle.textStyle24whiteW400,
                onTap: _submitForm,
              ),
              SizedBox(height: height * 0.03),
              Row(
                spacing: 5.0,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ?",
                    textAlign: TextAlign.center,
                    style: AppTextstyle.textStyle16blackW400,
                  ),
                  TextButton(
                    onPressed: () {
                      // navigate to login page
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => Registrationscreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: AppTextstyle.textStyle22orrageW300,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
