import 'dart:io';

import 'package:dart_ping/dart_ping.dart';
import 'package:test/test.dart';

void main() {
  final seq = Platform.operatingSystem == 'macos' ? 0 : 1;
  group('Pinging demo: ', () {
    test('google.com', () async {
      var ping = Ping('google.com', count: 1);
      var data = await ping.stream.first;
      expect(data, isA<PingData>());
      expect(data.response?.seq, seq);
    });

    test('1.1.1.1', () async {
      var ping = Ping('1.1.1.1', count: 1);
      var data = await ping.stream.first;
      expect(data, isA<PingData>());
      expect(data.response?.ip, '1.1.1.1');
      expect(data.response?.seq, seq);
    });
  });

  group('Misuse: ', () {
    test('Termination before starting', () async {
      var ping = Ping('1.1.1.1', count: 5);
      expect(ping.stop(), throwsException);
    });
  });
}
