import 'package:flutter/material.dart';

class FocusTracker extends StatefulWidget {
  const FocusTracker({super.key});

  @override
  State<FocusTracker> createState() => _FocusTrackerState();
}

class _FocusTrackerState extends State<FocusTracker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Focus Tracker",
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
