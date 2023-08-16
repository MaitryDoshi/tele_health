import 'package:get/get.dart';

enum BnbItem {services, appointment,patientRecord, more }
class BottomNavController extends GetxController {
  static BottomNavController get to => Get.find();

  var currentPage = BnbItem.services.obs;
  void changePage(BnbItem bnbItem) {
    currentPage.value = bnbItem;
  }
}