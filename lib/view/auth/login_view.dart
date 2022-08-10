import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/constance.dart';
import 'package:e_commerce/view/auth/register_view.dart';
import 'package:e_commerce/view/widgets/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: 'Welcome',
                    fontSize: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.to(RegisterView());
                    },
                    child: CustomText(
                      text: 'Sign Up',
                      color: primaryColor,
                      fontSize: 18,
                    ),
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
                onSave: (value) {
                  controller.email = value;
                },
                validator: (value) {
                  if (value == null) {
                    print('Error');
                  }
                },
              ),
              SizedBox(height: 40),
              CustomTextFormField(
                text: 'Password',
                hint: '*********',
                keybourdType: TextInputType.visiblePassword,
                obscureText: true,
                onSave: (value) {
                  controller.password = value;
                },
                validator: (value) {
                  if (value == null) {
                    print('Error');
                  }
                },
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
                onPressed: () {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    controller.signInWithEmailAndPassword();
                  }
                },
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
                    controller.facebookSignInMethod();
                  },
                  image: 'assets/images/facebook.png',
                  text: 'Sign In with Facebook'),
              SizedBox(
                height: 40,
              ),
              CustomButtonSocial(
                image: 'assets/images/google.jpg',
                text: 'Sign In with Google',
                onpressed: () {
                  controller.googleSignInMethod();
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
