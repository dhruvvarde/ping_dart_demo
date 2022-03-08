import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'routes.dart';
import 'screens/home_screen.dart';

void main() async {
  runApp( const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.pageId,
      getPages: appPages,
    );
  }
}
