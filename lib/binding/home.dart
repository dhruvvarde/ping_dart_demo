import 'package:get/get.dart';
import 'package:ping_demo/controller/home.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(HomeController(), permanent: false);
  }
}
