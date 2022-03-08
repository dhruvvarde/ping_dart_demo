import 'package:ping_demo/screens/home_screen.dart';
import 'binding/home.dart';
import 'package:get/get.dart';

final List<GetPage> appPages = [
  GetPage(
      name: HomeScreen.pageId,
      page: () => HomeScreen(),
      binding: HomeBinding()),
];
