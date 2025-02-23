import 'package:flutter_storage_info_plus/flutter_storage_info.dart';
import 'package:flutter_storage_info_plus/flutter_storage_info_method_channel.dart';
import 'package:flutter_storage_info_plus/flutter_storage_info_platform_interface.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterStorageInfoPlatform
    with MockPlatformInterfaceMixin
    implements FlutterStorageInfoPlatform {
  @override
  Future<double?> getFreeStorage() => Future.value(42);
  @override
  Future<double?> getTotalStorage() => Future.value(42);
}

void main() {
  final FlutterStorageInfoPlatform initialPlatform =
      FlutterStorageInfoPlatform.instance;

  test('$MethodChannelFlutterStorageInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterStorageInfo>());
  });

  test('getTotalStorageData', () async {
    FlutterStorageInfoPlatform.instance = MockFlutterStorageInfoPlatform();
    expect(await FlutterStorageInfo().getTotalStorage(), 42);
  });

  test('getFreeStorageData', () async {
    FlutterStorageInfoPlatform.instance = MockFlutterStorageInfoPlatform();
    expect(await FlutterStorageInfo().getFreeStorage(), 42);
  });
}
