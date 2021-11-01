import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nevina_infotech/app/constants/app_errors.dart';
import 'package:nevina_infotech/app/models/login_response.dart';
import 'package:nevina_infotech/app/routes/app_pages.dart';
import 'package:nevina_infotech/app/services/api_helper.dart';

class LoginController extends GetxController {
  final apiHelper = Get.find<ApiHelper>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void loginAccount() {
    Map<String, String> requestMap = {
      'email': emailController.text,
      'password': passwordController.text,
    };
    if (loginFormKey.currentState!.validate())
      apiHelper.login(requestMap).then(
        (response) {
          LoginResponse responseData = LoginResponse.fromJson(response.body);
          if (responseData.statusCode == '200')
            Get.offAllNamed(Routes.HOME);
          else
            Get.snackbar(
              AppErrors.somethingWentWrong,
              responseData.message!,
            );
        },
      );
  }
}
