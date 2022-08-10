import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/services/home_services.dart';
import 'package:e_commerce/model/category_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/product_model.dart';

class HomeViewModel extends GetxController {
  ValueNotifier<bool> get loading=>_loading;
  ValueNotifier<bool> _loading=ValueNotifier(false);
  List<CategoryModel> _categoryModel = [];
  List<CategoryModel> get categoryModel => _categoryModel;
  List<ProductModel> _productModel = [];
  List<ProductModel> get productModel => _productModel;

  HomeViewModel() {
    getCategory();
    getBestSellingProduct();
  }

  getCategory() async {
    _loading.value=true;
    HomeServices().getCategory().then((value) {
      for(int i=0;i<value!.length;i++){
        //casting error solved by as
        _categoryModel.add(CategoryModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
        _loading.value=false;
      }
      update();
    });
  }
  getBestSellingProduct() async {
    _loading.value=true;
    HomeServices().getBestSelling().then((value) {
      for(int i=0;i<value!.length;i++){
        //casting error solved by as
        _productModel.add(ProductModel.fromJson(value[i].data() as Map<dynamic,dynamic>));
        _loading.value=false;
      }
      update();
      print(_productModel.length);
    });
  }

}
