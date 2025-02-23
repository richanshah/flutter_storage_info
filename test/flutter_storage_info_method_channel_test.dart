import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_storage_info/flutter_storage_info_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelFlutterStorageInfo platform = MethodChannelFlutterStorageInfo();
  const MethodChannel channel = MethodChannel('storage_info_data');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return 42.2;
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  // change number as per your device storage value
  test('getFreeStorage', () async {
    expect(await platform.getFreeStorage(), 42.2);
  });

  // change number as per your device storage value
  test('getTotalStorage', () async {
    expect(await platform.getTotalStorage(), 42.2);
  });
}
