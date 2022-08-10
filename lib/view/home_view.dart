import 'package:e_commerce/constance.dart';
import 'package:e_commerce/core/view_model/home_view_model.dart';
import 'package:e_commerce/view/details_view.dart';
import 'package:e_commerce/view/widgets/custom_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends GetWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      // مش فاهمة الجزء دا وعمل ايرور عندي
      //init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, right: 20, top: 100),
                  child: Column(
                    children: [
                      //-----------------------Search bar
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'Search',
                            fillColor: Colors.grey.shade300,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.black,
                            )),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      CustomText(
                        text: 'Catgories',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //-----------------------Categories
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: 20,
                          ),
                          itemCount: controller.categoryModel.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Image.network(
                                    controller.categoryModel[index].image!),
                              ),
                              SizedBox(height: 20),
                              CustomText(
                                text: controller.categoryModel[index].name,
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //-----------------------Best Selling
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: 'Best Selling',
                            fontSize: 18,
                          ),
                          CustomText(
                            text: 'See all',
                            fontSize: 16,
                            alignment: Alignment.topRight,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //-----------------------Best Selling items
                      SizedBox(
                        height: 400,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                            width: 20,
                          ),
                          itemCount: controller.productModel.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: (){Get.to(DetailsView(productModel: controller.productModel[index],));},
                            child: Container(
                              width: MediaQuery.of(context).size.width * .4,
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50)),
                                    child: Image.network(
                                      controller.productModel[index].image!,
                                      height: 240,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    text: controller.productModel[index].name,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  CustomText(
                                    text: controller
                                        .productModel[index].description,
                                    color: Colors.grey,
                                    maxLine: 1,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  CustomText(
                                    text: '\$${controller.productModel[index].price}',
                                    color: primaryColor,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              bottomNavigationBar: CustomBottomNavigationBar(),
            ),
    );
  }
}
