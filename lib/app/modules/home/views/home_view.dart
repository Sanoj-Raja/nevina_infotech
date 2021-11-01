import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nevina_infotech/app/constants/app_strings.dart';
import 'package:nevina_infotech/app/widgets/large_button.dart';
import '../controllers/home_controller.dart';
import 'components/time_picker.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 12),
          child: Column(
            children: [
              Expanded(
                child: Obx(
                  () => ListView(
                    children: <TimePickerCard>[...controller.timePickerCards],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              LargeButton(
                buttonText: AppStrings.addMore,
                onPressed: controller.addMorePickers,
              )
            ],
          ),
        ),
      ),
    );
  }
}
