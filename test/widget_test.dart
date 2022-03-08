import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:ping_demo/controller/home.dart';

import 'package:ping_demo/main.dart';
import 'package:ping_demo/model/ping_model.dart';
import 'package:ping_demo/widgets/ping_button.dart';

void main() {
  testWidgets('Get 5 time response on button tap', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    var button = find.text("Ping Here");
    expect(button, findsOneWidget);
    await tester.tap(button);
    await tester.tap(find.byType(CustomButton));
    await tester.pump();
  });
}

class HomeScreen extends GetView<HomeController> {
  static const pageId = "/Home";

  Duration times = const Duration();

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ping Dart GetX Demo'),
      ),
      body: Center(
        child: Column(
          children: [
            CustomButton(
              title: "Ping demo",
              onCallback: ping,
            ),
          ],
        ),
      ),
    );
  }

  ping() {
    final ping = Ping('google.com', count: 5);
    print('Running command: ${ping.command}');

    ping.stream.listen((event) {
      PingTime model =
          PingTime(ip: event.response!.ip, time: event.response!.time);
      controller.pingTime.add(model);
      times = times + event.response!.time!;
      print("Added " + times.toString());
      controller.durationSum.add(times);
      print("Added Array " + controller.durationSum.toString());
      print(event.response);
    });
  }
}
