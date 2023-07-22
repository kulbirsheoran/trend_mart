import 'dart:io';

import 'package:emartapp/constant/color.dart';
import 'package:emartapp/constant/string.dart';
import 'package:emartapp/controller/profile_controller.dart';
import 'package:emartapp/widget/button.dart';
import 'package:emartapp/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class ProfileEdit extends StatelessWidget {
  const ProfileEdit({Key? key, this.user}) : super(key: key);
  final dynamic user;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    controller.nameController.text = user['name'];
    controller.newpassController.text = user['password'];

    return Scaffold(
        appBar: AppBar(),
        body: Obx(
              () => ListView(children: [
            _buildProfileImage(context, controller),
            10.heightBox,
            customTextField(
                controller: controller.nameController,
                hint: namehint,
                title: name,
                isPass: false),
            10.heightBox,
            customTextField(
                controller: controller.oldpassController,
                hint: passwordHint,
                title: oldpass,
                isPass: true),
            10.heightBox,
            customTextField(
                controller: controller.newpassController,
                hint: passwordHint,
                title: newpass,
                isPass: true),
            10.heightBox,
            _buildButton(context, controller),
            5.heightBox
          ]),
        ));
  }

  Widget _buildProfileImage(BuildContext context, ProfileController controller) {
    return GestureDetector(
      onTap: () {
        controller.changeImage(context);
      },
      child: Stack(
        children: [
          user['imageUrl'] == '' && controller.profileImgPath.isEmpty
              ? Image.asset(
            'assets/images/womenclothes.jpg',
            width: 80,
            fit: BoxFit.cover,
          )
              : user['imageUrl'] != '' && controller.profileImgPath.isEmpty
              ? Image.network(user['imageUrl'], width: 80, fit: BoxFit.cover)
              : Image.file(
            File(controller.profileImgPath.value),
            width: 80,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, ProfileController controller) {
    return controller.isLoading.value
        ? CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(redColor),
    )
        : SizedBox(
      width: context.screenWidth - 50,
      child: Button(
          Color: Colors.red,
          textColor: Colors.white,
          title: 'save',
          onPress: () async {
            controller.isLoading(true);
            if (controller.profileImgPath.value.isNotEmpty) {
              await controller.uploadProfileImage();
            } else {
              controller.profileImageLink = user['imageUrl'];
            }
            if (user['password'] == controller.oldpassController.text) {
              await controller.changeAuthPassword(
                  email: user['email'],
                  password: controller.oldpassController.text,
                  newpassword: controller.newpassController.text);
              await controller.updateProfile(
                  name: controller.nameController.text,
                  password: controller.newpassController.text,
                  imgUrl: controller.profileImageLink);
              VxToast.show(context, msg: 'Updated');
            } else {
              VxToast.show(context, msg: 'wrong old password');
              controller.isLoading(false);
            }
          }),
    );
  }
}
