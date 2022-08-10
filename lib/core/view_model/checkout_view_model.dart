import 'dart:ui';

import 'package:e_commerce/view/control_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constance.dart';

class CheckoutViewModel extends GetxController{

  int _index=0;
  int get index => _index;
  Pages _pages = Pages.DeliveryTime;
  Pages get pages=>_pages;
void changeIndex(i){
  _index=i;
  if(_index==1)_pages=Pages.AddAddress;
  else if(_index==1)_pages=Pages.Summary;
  else if(_index==1)Get.to(ControlView());
  update();
}
  Color getColor(int i) {
    if (i == _index) {
      return inProgressColor;
    } else if (i < _index) {
      return Colors.green;
    } else {
      return todoColor;
    }
  }

}