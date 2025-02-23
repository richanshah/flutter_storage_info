import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'flutter_storage_info_platform_interface.dart';

/// An implementation of [FlutterStorageInfoPlatform] that uses method channels.
class MethodChannelFlutterStorageInfo extends FlutterStorageInfoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('storage_info_data');

  @override
  Future<double?> getFreeStorage() async {
    final double? freeStorage = await methodChannel.invokeMethod<double>('getFreeStorageData');
    return freeStorage;
  }

  @override
  Future<double?> getTotalStorage() async {
    final double? totalStorage = await methodChannel.invokeMethod<double>('getTotalStorageData');
    return totalStorage;
  }
}
