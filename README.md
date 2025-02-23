# Flutter Storage Info Plugin
A Flutter plugin to retrieve **free storage** and **available storage** on both **Android** and **iOS** using Method Channels.

## Features

✅ Get **free storage** space in GB  
✅ Get **available storage** (total - used) in GB  
✅ Supports **Android & iOS**  
✅ Uses **Flutter Method Channels** to communicate with native platforms  

---

## Installation

1. **Add dependency** to your `pubspec.yaml`:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     flutter_storage_info_plus:
   ```
2. **Run**:
   ```sh
   flutter pub get
   ```

---

## Usage

### **1. Import the package**
```dart
import 'package:flutter_storage_info_plus/flutter_storage_info_plus.dart';
```

### **2. Fetch Storage Info**

#### Get Free Storage:
```dart
double? freeStorage = await FlutterStorageInfo().getFreeStorage();
print("Free Storage: $freeStorage GB");
```

#### Get Available Storage:
```dart
double? availableStorage = await FlutterStorageInfo().getAvailableStorage();
print("Available Storage: $availableStorage GB");
```

---


## Contribution

👨‍💻 Contributions are welcome! Feel free to **fork, modify, and submit PRs**.  
For feature requests and issues, open a ticket in the **GitHub issues** section.

---

## License

📝 **MIT License**  
Feel free to use and modify this plugin in your projects.

---

## Author

👩‍💻 **Richa**  
🚀 **Follow for more Flutter plugins and development tips!**

```