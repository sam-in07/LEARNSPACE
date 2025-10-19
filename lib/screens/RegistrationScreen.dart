import 'package:flutter/material.dart';
import 'package:learnsphere/screens/LoginScreen.dart';
import 'package:learnsphere/widgets/customer_text_feild.dart';

import '../widgets/app_text_style.dart';
import '../widgets/colors.dart';
import '../widgets/primary_button.dart';

class Registrationscreen extends StatefulWidget {
  const Registrationscreen({super.key});

  @override
  State<Registrationscreen> createState() => _RegistrationscreenState();
}

class _RegistrationscreenState extends State<Registrationscreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('created account sucessfully')));
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => Loginscreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 15.0,
            children: [
              SizedBox(height: 25.0),
              // title
              Center(
                child: SizedBox(
                  height: 85,
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Image.asset(
                    'assets/images/lrm_sm.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Text Fields
              CustomerTextField(
                controller: _nameController,
                labelText: 'Name',
                hintText: 'enter your name',
              ),
              CustomerTextField(
                controller: _emailController,
                labelText: 'Email',
                hintText: 'enter your email',
              ),
              CustomerTextField(
                controller: _passwordController,
                labelText: 'Password',
                hintText: 'enter your password',
                isPassword: true,
              ),
              CustomerTextField(
                controller: _confirmPasswordController,
                labelText: 'Confirm Password',
                hintText: 'confirm your password',
                isPassword: true,
              ),

              SizedBox(height: 25),

              // sign up button
              PrimaryButton(
                height: 55,
                width: 346,
                radius: 5.5,
                color: AppColors.primaryColor,
                title: 'Sign Up',
                textStyle: AppTextstyle.textStyle24whiteW400,
                onTap: () {
                  _submitForm();
                },
              ),

              // navigate to login page
              Row(
                spacing: 5.0,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ?",
                    textAlign: TextAlign.center,
                    style: AppTextstyle.textStyle16blackW400,
                  ),
                  TextButton(
                    onPressed: () {
                      // navigate to login page
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (ctx) => Loginscreen()),
                      );
                    },
                    child: Text(
                      "Sign In",
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
