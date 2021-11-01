import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nevina_infotech/app/constants/app_colors.dart';
import 'package:nevina_infotech/app/constants/app_strings.dart';

// ignore: must_be_immutable
class TimePickerCard extends StatelessWidget {
  TimePickerCard({Key? key}) : super(key: key);
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          halfTextFeild(
            AppStrings.startTime,
            startTimeController,
          ),
          halfTextFeild(
            AppStrings.endTime,
            endTimeController,
          ),
        ],
      ),
    );
  }

  halfTextFeild(
    String hintText,
    TextEditingController textController,
  ) {
    return InkWell(
      onTap: () {
        print('tapped.');
        pickTime(textController);
      },
      child: Container(
        width: Get.width * .35,
        child: TextFormField(
          controller: textController,
          keyboardType: TextInputType.text,
          cursorColor: AppColors.black,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            isDense: true,
            hintText: hintText,
            enabled: false,
            hintStyle: Get.textTheme.subtitle2!.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickTime(TextEditingController textController) async {
    final TimeOfDay? picked = await showTimePicker(
      context: Get.context!,
      initialTime: selectedTime,
    );
    if (picked != null) selectedTime = picked;
    textController.text =
        selectedTime.hour.toString() + ':' + selectedTime.minute.toString();
  }
}
