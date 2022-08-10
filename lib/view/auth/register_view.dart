import 'package:e_commerce/view/auth/login_view.dart';
import 'package:e_commerce/view/widgets/custom_widgets.dart';
import 'package:e_commerce/constance.dart';
import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterView extends GetWidget<AuthViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Get.off(LoginView());
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
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
              CustomText(
                alignment: Alignment.topLeft,
                text: 'Sign Up',
                fontSize: 30,
              ),
              SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                text: 'Name',
                hint: 'Aliaa',
                keybourdType: TextInputType.emailAddress,
                onSave: (value) {
                  controller.name = value;
                },
                validator: (value) {
                  if (value == null) {
                    print('Error');
                  }
                },
              ),
              SizedBox(height: 40),
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
              CustomButton(
                color: primaryColor,
                text: 'SIGN UP',
                onPressed: () {
                  _formKey.currentState!.save();
                  if (_formKey.currentState!.validate()) {
                    controller.createAccountWithEmailAndPassword();
                  }
                },
              ),
            ],
          ),
        )),
      ),
    );
  }
}
