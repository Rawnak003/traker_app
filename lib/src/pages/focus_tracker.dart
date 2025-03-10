import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tracking_app/src/widgets/focus_tracker_widgets/center_ui_widget.dart';

class FocusTracker extends StatefulWidget {
  const FocusTracker({super.key});

  @override
  State<FocusTracker> createState() => _FocusTrackerState();
}

class _FocusTrackerState extends State<FocusTracker> {
  Timer? timer;
  bool isPaused = true;
  int maxSecond = 1;
  int currentSecond = 0;

  int selectedHour = 0;
  int selectedMinute = 0;
  int selectedSecond = 0;

  List<String> hourList = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
  ];
  List<String> minuteList = [
    '0',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59',
  ];
  List<String> secList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50',
    '51',
    '52',
    '53',
    '54',
    '55',
    '56',
    '57',
    '58',
    '59',
  ];

  void startTimer() {
    if (currentSecond > 0) {
      // Only start if time is set
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (!isPaused) {
          addTimer();
        }
      });
    }
  }

  void addTimer() {
    if (currentSecond > 0) {
      setState(() {
        currentSecond--; // Countdown by 1 second
        selectedHour = currentSecond ~/ 3600;
        selectedMinute = (currentSecond % 3600) ~/ 60;
        selectedSecond = (currentSecond % 60);
      });
    } else {
      setState(() {
        isPaused = true;
        currentSecond = maxSecond;
        // timer?.cancel();
      });
      // Stop the timer at 0
    }
  }

  void setTime() {
    setState(() {
      maxSecond =
          selectedSecond + (selectedMinute * 60) + (selectedHour * 3600);
      currentSecond = maxSecond; // Initialize countdown timer
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          "Focus Tracker",
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              width: screenWidth,
              height: screenHeight * .075,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.22,
                        child: DropdownButtonFormField(
                          items:
                              hourList
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 5,
                              ),
                            ),
                            labelText: 'Hour',
                            labelStyle: TextStyle(color: Colors.black),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onChanged: (value) {
                            selectedHour = int.parse(value!);
                            setTime();
                          },
                          dropdownColor:
                              Colors.white, // Customize background color
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ), // Customize text style
                          isExpanded: true, // Ensures the dropdown expands properly
                          menuMaxHeight: 250,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.22,
                        child: DropdownButtonFormField(
                          items:
                              minuteList
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            labelText: 'Minute',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onChanged: (value) {
                            selectedMinute = int.parse(value!);
                            setTime();
                          },
                          dropdownColor:
                              Colors.white, // Customize background color
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ), // Customize text style
                          isExpanded:
                              true, // Ensures the dropdown expands properly
                          menuMaxHeight: 250,
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.1,
                        width: screenWidth * 0.22,
                        child: DropdownButtonFormField(
                          items:
                              secList
                                  .map(
                                    (e) => DropdownMenuItem(
                                      value: e,
                                      child: Text(e),
                                    ),
                                  )
                                  .toList(),
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            labelText: 'Second',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                          onChanged: (value) {
                            selectedSecond = int.parse(value!);
                            setTime();
                          },
                          dropdownColor:
                              Colors.white, // Customize background color
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ), // Customize text style
                          isExpanded:
                              true, // Ensures the dropdown expands properly
                          menuMaxHeight: 250,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 100),
            Center(
              child: CenterUI(
                currentSecond: currentSecond,
                maxSecond: maxSecond,
                selectedHour: selectedHour,
                selectedMinute: selectedMinute,
                selectedSecond: selectedSecond,
              ),
            ),
            SizedBox(height: 100),
            Row(
              // buttons
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    isPaused = !isPaused;
                    setState(() {});
                    if (timer == null) {
                      startTimer();
                    }
                  },
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: isPaused ? Colors.green : Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      isPaused ? "Start" : "Pause",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 25),
                InkWell(
                  onTap: () {
                    timer = null;
                    isPaused = true;
                    maxSecond = 1;
                    currentSecond = 0;
                    selectedHour = 0;
                    selectedMinute = 0;
                    selectedSecond = 0;
                    setState(() {});
                  },
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Clear",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
