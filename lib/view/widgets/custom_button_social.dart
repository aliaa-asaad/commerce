import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomButtonSocial extends StatelessWidget {
  final String image;
  final String? text;
  final void Function()? onpressed;

  const CustomButtonSocial({required this.image, this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
      onPressed: onpressed,
      child: Row(
        children: [
          Image.asset(
            image,
            height: 20,
            width: 20,
          ),
          SizedBox(
            width: 90,
          ),
          CustomText(
            text: text,
          )
        ],
      ),
    );
  }
}
