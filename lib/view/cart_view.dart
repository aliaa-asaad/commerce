import 'package:e_commerce/core/view_model/cart_view_model.dart';
import 'package:e_commerce/view/checkout/checkout_view.dart';
import 'package:e_commerce/view/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constance.dart';

class CartView extends StatelessWidget {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartViewModel>(
//init:Get.find(),
              builder: (controller) => SizedBox(
                  child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                  height: 20,
                ),
                itemBuilder: (context, index) => SizedBox(
                  height: 140,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                        controller.cartProductModel![index].image!,
                        height: 150,
                        width: 150,
                        fit: BoxFit.fill,
                      ),
                      Column(
                        children: [
                          Text.rich(
                            TextSpan(children: [
                              TextSpan(
                                  text:
                                      controller.cartProductModel![index].name,
                                  style: TextStyle(
                                    fontSize: 16,
                                  )),
                              TextSpan(
                                  text:
                                      '\n${controller.cartProductModel![index].price}',
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 16,
                                  ))
                            ]),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 120,
                            decoration: BoxDecoration(
                                color: Color(0xffDDDDDD),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                  onPressed: () {controller.increaseQuantity(index);},
                                  icon: Icon(Icons.add),
                                ),
                                CustomText(
                                  text: controller.cartProductModel![index].quantity.toString(),
                                ),
                                IconButton(
                                  onPressed: () {controller.decreaseQuantity(index);},
                                  icon: Icon(Icons.remove),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                itemCount: controller.cartProductModel!.length,
              )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    CustomText(
                      text: 'TOTAL',
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                    GetBuilder<CartViewModel>(
                     // init:Get.find(),
                      builder:(controller)=> CustomText(
                        text: '\$${controller.totalPrice}',
                        color: primaryColor,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height: 50,
                    width: 140,
                    child: CustomButton(
                      text: 'CHECKOUT',
                      onPressed: () { Get.to(CheckoutView());},
                      color: primaryColor,
                    ))
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
    );
  }
}
