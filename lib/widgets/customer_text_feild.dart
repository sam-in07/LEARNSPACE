import 'package:flutter/material.dart';

class CustomerTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Widget? prefixWidget;
  final bool isPassword;

  const CustomerTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.prefixWidget,
    this.isPassword = false,
  });

  @override
  State<CustomerTextField> createState() => _CustomerTextFieldState();
}

class _CustomerTextFieldState extends State<CustomerTextField> {
  // State variable to manage visibility, only used if isPassword is true
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 1. Label Text (The "Email Address" or "Password" bold text)
        Text(
          widget.labelText,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8.0),

        // 2. The Input Field
        TextFormField(
          controller: widget.controller,


          obscureText: _isObscure,



          decoration: InputDecoration(
            hintText: widget.hintText,


            fillColor: Colors.grey.shade100,
            filled: true,

            contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),


            prefixIcon: widget.prefixWidget,


            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _isObscure ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isObscure = !_isObscure;
                });
              },
            )
                : null,


            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
              borderSide: BorderSide(color: Colors.grey.shade400, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),

              borderSide: const BorderSide(color: Colors.black, width: 2.0),
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
        ),
      ],
    );
  }
}