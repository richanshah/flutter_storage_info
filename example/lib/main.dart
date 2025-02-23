import 'package:flutter/material.dart';
import 'package:flutter_storage_info/flutter_storage_info.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Storage Info',
      theme: ThemeData(
        primaryColor: const Color(0xFF616DA1), // Your preferred color
      ),
      home: StorageInfoScreen(),
    );
  }
}

class StorageInfoScreen extends StatefulWidget {
  @override
  _StorageInfoScreenState createState() => _StorageInfoScreenState();
}

class _StorageInfoScreenState extends State<StorageInfoScreen> {
  final FlutterStorageInfo _storageInfo = FlutterStorageInfo();
  double? freeStorage;
  double? totalStorage;

  void fetchFreeStorage() async {
    double? storage = await _storageInfo.getFreeStorage();
    setState(() {
      freeStorage = storage;
    });
  }

  void fetchAvailableStorage() async {
    double? storage = await _storageInfo.getTotalStorage();
    setState(() {
      totalStorage = storage; // Assuming this is the totalStorage storage data
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Storage Info'),
        backgroundColor: const Color(0xFF616DA1), // Your preferred color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Free Storage Button
              ElevatedButton(
                onPressed: fetchFreeStorage,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF616DA1), // Your preferred color
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Get Free Storage',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                freeStorage != null
                    ? 'Free Storage: ${freeStorage!.toStringAsFixed(2)} GB'
                    : 'Press button to fetch Free Storage',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 30),

              // Available Storage Button
              ElevatedButton(
                onPressed: fetchAvailableStorage,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF616DA1), // Your preferred color
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Get Available Storage',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                totalStorage != null
                    ? 'Total Storage: ${totalStorage!.toStringAsFixed(2)} GB'
                    : 'Press button to fetch Total Storage',
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
