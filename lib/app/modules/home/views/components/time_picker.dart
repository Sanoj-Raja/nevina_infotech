import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nevina_infotech/app/constants/app_colors.dart';
import 'package:nevina_infotech/app/constants/app_errors.dart';
import 'package:nevina_infotech/app/constants/app_strings.dart';
import 'package:nevina_infotech/app/local_storage/session_manger.dart';

class TimePickerCard extends StatelessWidget {
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          halfTextFeild(
            true,
          ),
          halfTextFeild(
            false,
          ),
        ],
      ),
    );
  }

  halfTextFeild(bool isStartingTime) {
    return InkWell(
      onTap: () {
        pickTime(isStartingTime);
      },
      child: Container(
        width: Get.width * .35,
        child: TextFormField(
          controller: isStartingTime ? startTimeController : endTimeController,
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
            hintText:
                isStartingTime ? AppStrings.startTime : AppStrings.endTime,
            enabled: false,
            hintStyle: Get.textTheme.subtitle2!.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }

  Iterable<TimeOfDay> getTimes(TimeOfDay startTime, TimeOfDay endTime) sync* {
    Duration step = Duration(minutes: 1);
    int hour = startTime.hour;
    int minute = startTime.minute;

    do {
      yield TimeOfDay(hour: hour, minute: minute);
      minute += step.inMinutes;
      while (minute >= 60) {
        minute -= 60;
        hour++;
      }
    } while (hour < endTime.hour ||
        (hour == endTime.hour && minute <= endTime.minute));
  }

  Future<void> pickTime(bool isStartingTime) async {
    TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);

    final TimeOfDay? picked = await showTimePicker(
      context: Get.context!,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (picked != null) {
      selectedTime = picked;

      String selectedTimeString =
          "${selectedTime.hour.toString()}:${selectedTime.minute.toString()}";

      // Check for starting time string.
      if (isStartingTime) {
        if (TIME_INTERVALS.contains(selectedTimeString)) {
          Get.snackbar(
            AppErrors.sameIntervalSelected,
            AppErrors.sameIntervalSelectedDetails,
          );
        } else
          startTimeController.text = selectedTimeString;
      }

      // Check for ending time string.
      if (!isStartingTime && startTimeController.text.isNotEmpty) {
        endTimeController.text = selectedTimeString;
        List<String> timeIntervalsList = getTimes(
          TimeOfDay(
            hour: int.parse(startTimeController.text.split(':').first),
            minute: int.parse(startTimeController.text.split(':').last),
          ),
          TimeOfDay(
            hour: int.parse(endTimeController.text.split(':').first),
            minute: int.parse(endTimeController.text.split(':').last),
          ),
        ).map((tod) => tod.format(Get.context!)).toList();

        bool isAlreadyExists = false;
        for (String interval in timeIntervalsList) {
          if (TIME_INTERVALS.contains(interval)) {
            isAlreadyExists = true;
            break;
          }
        }
        if (!isAlreadyExists)
          TIME_INTERVALS.addAll(timeIntervalsList);
        else {
          endTimeController.text = '';
          Get.snackbar(
            AppErrors.sameIntervalSelected,
            AppErrors.sameIntervalSelectedDetails,
          );
        }
      }
    }
  }
}
