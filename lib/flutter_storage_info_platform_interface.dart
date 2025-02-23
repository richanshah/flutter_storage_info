import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_storage_info_method_channel.dart';

abstract class FlutterStorageInfoPlatform extends PlatformInterface {
  /// Constructs a FlutterStorageInfoPlatform.
  FlutterStorageInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterStorageInfoPlatform _instance =
      MethodChannelFlutterStorageInfo();

  /// The default instance of [FlutterStorageInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterStorageInfo].
  static FlutterStorageInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterStorageInfoPlatform] when
  /// they register themselves.
  static set instance(FlutterStorageInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<double?> getFreeStorage() {
    throw UnimplementedError('getFreeStorage() has not been implemented.');
  }

  Future<double?> getTotalStorage() {
    throw UnimplementedError('getTotalStorage() has not been implemented.');
  }
}
