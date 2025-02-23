import 'flutter_storage_info_platform_interface.dart';

class FlutterStorageInfo {
  /// get free storage space in bytes
  Future<double?> getFreeStorage() {
    return FlutterStorageInfoPlatform.instance.getFreeStorage();
  }

  /// get total storage space in bytes
  Future<double?> getTotalStorage() {
    return FlutterStorageInfoPlatform.instance.getTotalStorage();
  }
}
