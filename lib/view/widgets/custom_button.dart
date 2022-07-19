import 'package:flutter/material.dart';
import 'custom_text.dart';
class CustomButton extends StatelessWidget {
  final String? text;
  final Function() onPressed;
  final Color? color;

  const CustomButton({ this.text,required this.onPressed,this.color});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
        backgroundColor:  MaterialStateProperty.all(color),
        padding: MaterialStateProperty.all(
          EdgeInsets.all(15),
        ),

      ),
      onPressed: onPressed,
      child: CustomText(
        text: text,
        color: Colors.white,
        alignment: Alignment.center,
      ),
    );
  }
}
