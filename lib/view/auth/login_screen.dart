import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/constance.dart';
import 'package:e_commerce/view/widgets/custom_button.dart';
import 'package:e_commerce/view/widgets/custom_button_social.dart';
import 'package:e_commerce/view/widgets/custom_text.dart';
import 'package:e_commerce/view/widgets/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetWidget<AuthViewModel> {
  bool password = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 50,
          right: 20,
          left: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Welcome',
                    fontSize: 30,
                  ),
                  CustomText(
                    text: 'Sign Up',
                    color: primaryColor,
                    fontSize: 18,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              CustomText(
                alignment: Alignment.topLeft,
                text: 'Sign in to continue',
                color: Colors.grey,
                fontSize: 14,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: 'Email',
                hint: 'example@gmail.com',
                keybourdType: TextInputType.emailAddress,
                onSave: (value) {},
                validator: (value) {},
              ),
              SizedBox(height: 40),
              CustomTextFormField(
                text: 'Password',
                hint: '*********',
                keybourdType: TextInputType.visiblePassword,
                obscureText: password,
                /* icon: IconButton(
                  icon: password
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                  onPressed: () {
                    setState(() {
                      password = !password;
                    });
                  },
                ),*/
                onSave: (value) {},
                validator: (value) {},
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                alignment: Alignment.topRight,
                text: 'Forgot password?',
                fontSize: 14,
              ),
              SizedBox(
                height: 20,
              ),
              CustomButton(
                color: primaryColor,
                text: 'SIGN IN',
                onPressed: () {},
              ),
              SizedBox(
                height: 20,
              ),
              CustomText(
                alignment: Alignment.center,
                text: '-OR-',
                fontSize: 14,
              ),
              SizedBox(
                height: 40,
              ),
              CustomButtonSocial(
                  onpressed: () {
                    controller.FacebookSignInMethod();
                  },
                  image: 'assets/images/facebook.png',
                  text: 'Sign In with Facebook'),
              SizedBox(
                height: 40,
              ),
              CustomButtonSocial(
                image: 'assets/images/google.jpg',
                text: 'Sign In with Google',
                onpressed: () {controller.GoogleSignInMethod();},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

