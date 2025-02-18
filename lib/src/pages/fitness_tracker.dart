import 'package:flutter/material.dart';

class FitnessTracker extends StatefulWidget {
  const FitnessTracker({super.key});

  @override
  State<FitnessTracker> createState() => _FitnessTrackerState();
}

class _FitnessTrackerState extends State<FitnessTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness Tracker",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepPurple.shade800,
        centerTitle: true,
      ),
    );
  }
}
