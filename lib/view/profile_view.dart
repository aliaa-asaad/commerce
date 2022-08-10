import 'package:e_commerce/model/profile_view_model.dart';
import 'package:e_commerce/view/auth/login_view.dart';
import 'package:e_commerce/view/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends GetWidget {
  List accMenue = [
    'Edit Profile',
    'Shipping Address',
    'Order History',
    'Cards',
    'Notifications'
  ];
  List accIcons = [
    'assets/images/accMenuIcons/Icon_Edit-Profile.png',
    'assets/images/accMenuIcons/Icon_Location.png',
    'assets/images/accMenuIcons/Icon_History.png',
    'assets/images/accMenuIcons/Icon_Payment.png',
    'assets/images/accMenuIcons/Icon_Alert.png'
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileViewModel>(
      init: ProfileViewModel(),
      builder: (controller) => controller.loading!.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: 65,
                            /*  backgroundImage: controller.userModel == null
                          ? AssetImage('assets/images/Avatar.png')
                          : controller.userModel!.picture == 'default'
                              ? AssetImage('assets/images/Avatar.png')
                              : NetworkImage(controller.userModel!.picture),*/
                          ),
                          Column(
                            children: [
                              CustomText(
                                text: controller.userModel!.name,
                                fontSize: 20,
                              ),
                              CustomText(
                                text: controller.userModel!.email,
                                fontSize: 20,
                              )
                            ],
                          )
                        ],
                      ),
                      ListView.separated(
                          itemBuilder: (c, i) => ListTile(
                                title: Text('${accMenue[i]}'),
                                leading: Image.asset('${accIcons[i]}'),
                                trailing: Icon(Icons.navigate_next),
                              ),
                          separatorBuilder: (c, i) => SizedBox(
                                height: 15,
                              ),
                          itemCount: accMenue.length),
                      SizedBox(
                        height: 15,
                      ),
                      InkWell(
                        onTap: () {
                          controller.signOut();
                          Get.offAll(LoginView());
                        },
                        child: ListTile(
                          title: Text('Log out'),
                          leading: Image.asset(
                              'assets/images/accMenuIcons/Icon_Exit.png}'),
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
