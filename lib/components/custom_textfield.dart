import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.isPassword,
  }) : super(key: key);
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  

  @override
  Widget build(BuildContext context) {
    return (TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword,
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? const Icon(Icons.visibility_off_outlined)
            : const Text(''),
        hintText: widget.hintText,
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
          ),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter your ${widget.hintText}';
        }
        return null;
      },
    ));
  }
}
