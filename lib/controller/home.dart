import 'package:get/get.dart';
import 'package:ping_demo/controller/base.dart';
import 'package:ping_demo/model/ping_model.dart';

class HomeController extends BaseController {
  List<PingTime> pingTime = <PingTime>[].obs;
  List<Duration> durationSum = <Duration>[];

  @override
  void errorHandler(e) {}
}
