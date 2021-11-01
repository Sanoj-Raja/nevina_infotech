import 'package:get/get.dart';
import 'package:nevina_infotech/app/modules/home/views/components/time_picker.dart';

class HomeController extends GetxController {
  RxList<TimePickerCard> timePickerCards = <TimePickerCard>[
    TimePickerCard(),
  ].obs;

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

  void addMorePickers() {
    timePickerCards.add(TimePickerCard());
  }
}
