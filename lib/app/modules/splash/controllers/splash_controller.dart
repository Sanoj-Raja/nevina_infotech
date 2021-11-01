import 'package:get/get.dart';
import 'package:nevina_infotech/app/constants/app_assest.dart';
import 'package:nevina_infotech/app/routes/app_pages.dart';

class SplashController extends GetxController {
  final logo = AppImages.logo;

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

  void goToLogin() {
    Get.offAllNamed(Routes.LOGIN);
  }
}
