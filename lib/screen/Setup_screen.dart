import 'package:flutter/material.dart';
import '../models/user_data.dart';
import '../services/storage_service.dart';
import 'home_screen.dart';

class SetupScreen extends StatefulWidget {
  @override
  _SetupScreenState createState() => _SetupScreenState();
}

class _SetupScreenState extends State<SetupScreen> {
  DateTime? selectedDate;
  int cycle = 28;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Setup", style: TextStyle(fontSize: 28)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                selectedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2020),
                  lastDate: DateTime.now(),
                );
                setState(() {});
              },
              child: Text(selectedDate == null
                  ? "Select Last Period Date"
                  : selectedDate.toString()),
            ),
            Slider(
              value: cycle.toDouble(),
              min: 20,
              max: 40,
              divisions: 20,
              label: "$cycle days",
              onChanged: (val) {
                setState(() {
                  cycle = val.toInt();
                });
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (selectedDate == null) return;
                await StorageService.saveUser(UserData(
                    lastPeriodDate: selectedDate.toString(),
                    cycleLength: cycle));
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => HomeScreen()));
              },
              child: Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}