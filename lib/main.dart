import 'package:e_commerce/helper/binding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/view_model/cart_view_model.dart';
import 'view/home_view.dart';
import 'package:get/get.dart';
import 'view/auth/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(CartViewModel());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Binding(),
      theme:ThemeData(fontFamily: 'SF pro display'),
      home: LoginView(),
    );
  }
}
