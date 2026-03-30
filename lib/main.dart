import 'package:flutter/material.dart';
import 'screens/setup_screen.dart';
import 'screens/home_screen.dart';
import 'services/storage_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isSetupDone = await StorageService.isSetupDone();
  runApp(MyApp(isSetupDone: isSetupDone));
}

class MyApp extends StatelessWidget {
  final bool isSetupDone;
  const MyApp({required this.isSetupDone});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: isSetupDone ? HomeScreen() : SetupScreen(),
    );
  }
}