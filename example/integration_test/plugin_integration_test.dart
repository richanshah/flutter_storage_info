// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://flutter.dev/to/integration-testing


import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:flutter_storage_info/flutter_storage_info.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getFreeStorage', (WidgetTester tester) async {
    final storageInfo = FlutterStorageInfo();
    final freeStorage = await storageInfo.getFreeStorage();
    print('freeStorage: $freeStorage');
  });

  testWidgets('getTotalStorage', (WidgetTester tester) async {
    final storageInfo = FlutterStorageInfo();
    final totalStorage = await storageInfo.getTotalStorage();
    print('totalStorage: $totalStorage');
  });
}
