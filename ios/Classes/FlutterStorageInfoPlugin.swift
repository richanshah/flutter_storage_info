import Flutter
import UIKit

public class FlutterStorageInfoPlugin: NSObject, FlutterPlugin {

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "storage_info_data", binaryMessenger: registrar.messenger())
        let instance = FlutterStorageInfoPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        switch call.method {
        case "getFreeStorageData":
            result(getFreeStorageSize())
           case "getTotalStorageData":
            result(getTotalStorageSize())
        default:
            result(FlutterMethodNotImplemented)
        }
    }

    private func getFreeStorageSize() -> Double {
        let freeSpace = UIDevice.current.freeDiskSpaceInGB
        return (freeSpace as NSString).doubleValue
    }
    private func getTotalStorageSize() -> Double {
        let totalSpace = UIDevice.current.totalDiskSpaceInGB
        return (totalSpace as NSString).doubleValue
    }
}

extension UIDevice {

    func MBFormatter(_ bytes: Int64, units: ByteCountFormatter.Units = .useMB) -> String {
        let formatter = ByteCountFormatter()
        formatter.allowedUnits = units
        formatter.countStyle = .decimal
        formatter.includesUnit = false
        return formatter.string(fromByteCount: bytes)
    }

    var totalDiskSpaceInGB: String {
        return ByteCountFormatter.string(fromByteCount: totalDiskSpaceInBytes, countStyle: .decimal)
    }

    var freeDiskSpaceInGB: String {
        return ByteCountFormatter.string(fromByteCount: freeDiskSpaceInBytes, countStyle: .decimal)
    }

    var usedDiskSpaceInGB: String {
        return ByteCountFormatter.string(fromByteCount: usedDiskSpaceInBytes, countStyle: .decimal)
    }

    var totalDiskSpaceInBytes: Int64 {
        guard let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()),
              let space = (systemAttributes[.systemSize] as? NSNumber)?.int64Value else { return 0 }
        return space
    }

    var freeDiskSpaceInBytes: Int64 {
        if #available(iOS 11.0, *) {
            if let space = try? URL(fileURLWithPath: NSHomeDirectory()).resourceValues(forKeys: [.volumeAvailableCapacityForImportantUsageKey]).volumeAvailableCapacityForImportantUsage {
                return space
            }
        } else {
            if let systemAttributes = try? FileManager.default.attributesOfFileSystem(forPath: NSHomeDirectory()),
               let freeSpace = (systemAttributes[.systemFreeSize] as? NSNumber)?.int64Value {
                return freeSpace
            }
        }
        return 0
    }

    var usedDiskSpaceInBytes: Int64 {
        return totalDiskSpaceInBytes - freeDiskSpaceInBytes
    }
}
