import 'package:e_commerce/core/view_model/control_view_model.dart';
import 'package:e_commerce/view/cart_view.dart';
import 'package:e_commerce/view/home_view.dart';
import 'package:e_commerce/view/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final String? text;
  final Function() onPressed;
  final Color? color;

  const CustomButton({this.text, required this.onPressed, this.color});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(color),
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

class CustomText extends StatelessWidget {
  final String? text;
  final double? fontSize;
  final Color? color;
  final Alignment? alignment;
  final int? maxLine;
  final double? height;


  CustomText(
      {this.text,
      this.fontSize,
      this.maxLine,
      this.color = Colors.black,
      this.height=0,
      this.alignment = Alignment.topLeft});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: Text(
        '$text',
        style: TextStyle(color: color, fontSize: fontSize,height: height),
        maxLines: maxLine,
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String? text;
  final String? hint;
  final Function(String?)? onSave;
  final String? Function(String?)? validator;
  final TextInputType? keybourdType;
  final bool obscureText;
  final IconButton? icon;

  const CustomTextFormField(
      {this.text,
      this.hint,
      this.onSave,
      this.validator,
      this.keybourdType,
      this.obscureText = false,
      this.icon});

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
            suffixIcon: icon),
      ),
    ]);
  }
}

class CustomBottomNavigationBar extends GetWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControlViewModel>(
      init: ControlViewModel(),
      builder: (controller) => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text('Explore'),
            ),
            label: '',
            icon: Image.asset(
              'assets/images/Icon_Explore.png',
              width: 20,
              fit: BoxFit.contain,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('Cart'),
            ),
            label: '',
            icon: Image.asset(
              'assets/images/cart.png',
              width: 20,
              fit: BoxFit.contain,
            ),
          ),
          BottomNavigationBarItem(
            activeIcon: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text('Account'),
            ),
            label: '',
            icon: Image.asset(
              'assets/images/account.png',
              width: 20,
              fit: BoxFit.contain,
            ),
          ),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
          switch(index){
            case 0:Get.to(HomeView());break;
            case 1:Get.to(CartView());break;
            case 2:Get.to(ProfileView());break;

          }
        },
        elevation: 0,
        selectedItemColor: Colors.black,
      ),
    );
  }
}
