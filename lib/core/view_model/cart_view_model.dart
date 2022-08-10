import 'package:e_commerce/core/services/database/cart_database_helper.dart';
import 'package:e_commerce/model/cart_product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartViewModel extends GetxController {
  ValueNotifier<bool> _loading = ValueNotifier(false);

  ValueNotifier<bool> get loading => _loading;
  List<CartProductModel>? _cartProductModel = [];

  List<CartProductModel>? get cartProductModel => _cartProductModel;
  var dbHelper = CartDatabaseHelper.db;
  double? _totalPrice = 0.0;

  double? get totalPrice => _totalPrice;

  CartViewModel() {
    getAllProduct();
  }

  getAllProduct() async {
    _loading.value = true;
    _cartProductModel = await dbHelper.getAllProduct();
    _loading.value = false;
    getTotalPrice();
    update();
  }

  getTotalPrice() async {
    for (int i = 0; i < _cartProductModel!.length; i++) {
      _totalPrice = _totalPrice! +
          (double.parse(_cartProductModel![i].price!) *
              _cartProductModel![i].quantity!);
      print(_cartProductModel![i].price);
      print(_totalPrice);
      update();
    }
  }

  addProduct(CartProductModel cartProductModel) async {
    for (int i = 0; i < _cartProductModel!.length; i++) {
      if (_cartProductModel![i].productID == cartProductModel.productID) {
        return;
      }
    }
    await dbHelper.insert(cartProductModel);
    _cartProductModel!.add(cartProductModel);
    _totalPrice = _totalPrice! + double.parse(cartProductModel.price!);

    update();
  }

  increaseQuantity(int index) async{
    _cartProductModel![index].quantity =
        _cartProductModel![index].quantity! + 1;
    _totalPrice = _totalPrice! +
        (double.parse(cartProductModel![index].price!) *
            cartProductModel![index].quantity!);
    await dbHelper.updateProduact(_cartProductModel![index]);
    update();
  }

  decreaseQuantity(int index)async {
    _cartProductModel![index].quantity =
        _cartProductModel![index].quantity! - 1;
    _totalPrice = _totalPrice! - double.parse(cartProductModel![index].price!);
    await dbHelper.updateProduact(_cartProductModel![index]);

    update();
  }
}
