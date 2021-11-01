import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nevina_infotech/app/constants/app_strings.dart';
import 'package:nevina_infotech/app/utils/custom_text_fields.dart';
import 'package:nevina_infotech/app/widgets/large_button.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * .05,
                ),
                Text(
                  AppStrings.login,
                  style: Get.textTheme.headline1!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  AppStrings.pleaseLogin,
                  style: Get.textTheme.headline3!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: controller.loginFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      EmailTextField(controller: controller.emailController),
                      SizedBox(
                        height: 15,
                      ),
                      PasswordTextField(
                        controller: controller.passwordController,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                LargeButton(
                  buttonText: AppStrings.login,
                  onPressed: controller.loginAccount,
                  buttonHorizontalPadding: 0,
                ),
                SizedBox(
                  height: Get.height * .1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
