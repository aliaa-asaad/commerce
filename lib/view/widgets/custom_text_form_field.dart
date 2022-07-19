import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String? text;
  final String? hint;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;
  final TextInputType? keybourdType;
  final bool obscureText;
  final IconButton? icon;
  const CustomTextFormField(
      {this.text, this.hint, this.onSave, this.validator, this.keybourdType,this.obscureText=false,this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomText(
        alignment: Alignment.topLeft,
        text: text,
        color: Colors.grey.shade900,
        fontSize: 14,
      ),
      TextFormField(
        obscureText: obscureText,
        keyboardType: keybourdType,
        onSaved: onSave,
        validator: validator,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey),
          fillColor: Colors.white,
          suffixIcon: icon
        ),
      ),
    ]);
  }
}
