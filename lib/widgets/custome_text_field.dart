import 'package:flutter/material.dart';

class CustomeTextFormField extends StatelessWidget {
  CustomeTextFormField({
    super.key,
    this.text,
    this.onChanged,
    this.isSecure = false,
  });
  String? text;
  bool? isSecure;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecure!,
      validator: (data) {
        if (data!.isEmpty) {
          return 'field is required';
        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(color: Colors.white),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
