import 'package:flutter/material.dart';
import '../services/storage_service.dart';
import '../services/prediction_service.dart';
import '../models/user_data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? nextDate;

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    UserData? user = await StorageService.getUser();
    if (user != null) {
      DateTime last = DateTime.parse(user.lastPeriodDate);
      setState(() {
        nextDate = PredictionService.predictNext(last, user.cycleLength);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Tracker')),
      body: Center(
        child: nextDate == null
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Next Period",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Text(nextDate.toString(),
                      style: TextStyle(fontSize: 18)),
                ],
              ),
      ),
    );
  }
}