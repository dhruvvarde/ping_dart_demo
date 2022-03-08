import 'package:dart_ping/dart_ping.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ping_demo/controller/home.dart';
import 'package:ping_demo/model/ping_model.dart';
import 'package:ping_demo/widgets/ping_button.dart';

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
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              CustomButton(
                title: "Ping Here",
                onCallback: ping,
              ),
              Obx(
                () => controller.pingTime.isNotEmpty
                    ? Column(
                        children: [
                          for (var item in controller.pingTime.toList())
                            Text(item.time.toString()),
                          Text("Sum: " + controller.durationSum.last.toString())
                        ],
                      )
                    : const Text("Tap the button"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ping() {
    final ping = Ping('google.com', count: 5);
    ping.stream.listen((event) {
      PingTime model = PingTime(
        ip: event.response!.ip,
        time: event.response!.time,
      );
      controller.pingTime.add(model);
      times = times + event.response!.time!;
      controller.durationSum.add(times);
      print("Added Array " + controller.durationSum.toString());
      print(event.response);
    });
  }
}
