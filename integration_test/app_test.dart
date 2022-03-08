import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:ping_demo/main.dart';
import 'package:ping_demo/widgets/ping_button.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  testWidgets('Get 5 time response on button tap', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    var button = find.text("Ping Here");
    expect(button, findsOneWidget);
    await tester.tap(button);

    await tester.tap(find.byType(CustomButton));
    await tester.pump();
  });
  //
  // testWidgets('Get 5 time response on button tap', (WidgetTester tester) async {
  //   await tester.pumpWidget(MyApp());
  //   var button = find.text("Ping demo");
  //   expect(button, findsOneWidget);
  //   print("Ping demo");
  //   await tester.tap(button);
  //
  //   await tester.tap(find.byType(CustomButton));
  //   await tester.pump();
  // });
}
