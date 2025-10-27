import 'package:flutter/material.dart';
import 'package:learnsphere/widgets/colors.dart';

class CustomerTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Widget? prefixWidget;
  final bool isPassword;
  final String? Function(String?)? validator; // ✅ Optional validator

  const CustomerTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    this.prefixWidget,
    this.isPassword = false,
    this.validator, // ✅ Optional
  });

  @override
  State<CustomerTextField> createState() => _CustomerTextFieldState();
}

class _CustomerTextFieldState extends State<CustomerTextField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.only(
        left: screenWidth * 0.12,
        right: screenWidth * 0.12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 8.0),

          TextFormField(
            controller: widget.controller,
            obscureText: _isObscure,
            validator: widget.validator ??
                (value) {
                  // Default validator logic if custom one isn't passed
                  if (value == null || value.isEmpty) {
                    return "Enter ${widget.labelText.toLowerCase()} correctly";
                  }
                  return null;
                },
            decoration: InputDecoration(
              hintText: widget.hintText,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
              fillColor: AppColors.textgry,
              filled: true,
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
      ),
    );
  }
}
