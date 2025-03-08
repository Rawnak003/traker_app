import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../widgets/water_tracker_widgets/detail_card_widget.dart';
import '../widgets/water_tracker_widgets/list_tile_widget.dart';
import '../widgets/water_tracker_widgets/progress_card_widget.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  final TextEditingController _bmiController = TextEditingController();
  double recommendedIntake = 2500;
  double intakeValue = 0;
  List<int> waterIntake = [];
  List<int> hourNow = [];
  List<int> timeNow = [];
  getWaterIntake(double bmi) {
    if (bmi < 18.5) {
      recommendedIntake = 3000;
    } else if (bmi < 25.0) {
      recommendedIntake = 3500;
    } else if (bmi < 30.0) {
      recommendedIntake = 4000;
    } else if (bmi < 35.0) {
      recommendedIntake = 4500;
    } else if (bmi < 35.0) {
      recommendedIntake = 5000;
    } else if (bmi < 40.0) {
      recommendedIntake = 5500;
    } else {
      recommendedIntake = 6000;
    }
    setState(() {});
  }
  _addWater(int amount){
    setState(() {
      if(intakeValue < recommendedIntake){
        waterIntake.insert(0, amount);
        hourNow.insert(0, DateTime.now().hour);
        timeNow.insert(0, DateTime.now().minute);
        intakeValue = (intakeValue + amount).clamp(0, recommendedIntake);
      }
    });
  }
  _clr(){
    setState(() {
      _bmiController.clear();
      recommendedIntake = 2500;
      intakeValue = 0;
      waterIntake = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text(
          "Water Intake Tracker",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      floatingActionButton: SpeedDial(
        buttonSize: Size(65, 65),
        icon: Icons.add,
        activeIcon: Icons.close,
        iconTheme: IconThemeData(size: 35, color: Colors.white),
        backgroundColor: Colors.blueAccent,
        visible: true,
        curve: Curves.bounceIn,
        overlayColor: Colors.transparent,
        spacing: 15,
        spaceBetweenChildren: 10,
        children: [
          SpeedDialChild(
            child: Image.asset(
              "assets/water_tracker/50ml.png",
              width: 50,
              height: 40,
            ),
            backgroundColor: Colors.white,
            label: "Add 50 mL",
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            labelBackgroundColor: Colors.blue,
            onTap: () {_addWater(50);},
          ),
          SpeedDialChild(
            child: Image.asset(
              "assets/water_tracker/100ml.png",
              width: 50,
              height: 40,
            ),
            backgroundColor: Colors.white,
            label: "Add 100 mL",
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            labelBackgroundColor: Colors.blue,
            onTap: () {_addWater(100);},
          ),
          SpeedDialChild(
            child: Image.asset(
              "assets/water_tracker/200ml.png",
              width: 50,
              height: 40,
            ),
            backgroundColor: Colors.white,
            label: "Add 200 mL",
            labelStyle: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            labelBackgroundColor: Colors.blue,
            onTap: () {_addWater(200);},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              shadowColor: Colors.grey,
              elevation: 8,
              surfaceTintColor: Colors.white,
              child: SizedBox(
                width: screenWidth,
                height: screenHeight * .11,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: screenHeight * 0.1,
                          width: screenWidth * 0.75,
                          child: TextFormField(
                            controller: _bmiController,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: "Enter your BMI",
                              labelStyle: TextStyle(color: Colors.black),
                              helperText:
                                  "Please calculate your BMI first with BMI calculator",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  width: 3,
                                  color: Colors.deepPurple.shade800,
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.blue.shade50,
                            ),
                          ),
                        ),
                        Container(
                          height: screenWidth * .1285,
                          width: screenWidth * 0.13,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              width: 2,
                              color: Colors.deepPurple.shade800,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              double bmi = double.parse(_bmiController.text);
                              getWaterIntake(bmi);
                            },
                            icon: Icon(
                              Icons.water_drop_sharp,
                              color: Colors.blueAccent.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            ProgressCard(
              screenWidth: screenWidth,
              screenHeight: screenHeight,
              recommendedValue: recommendedIntake,
              intakeValue: intakeValue,
            ),
            SizedBox(height: screenHeight * 0.01),
            DetailsCard(screenHeight: screenHeight, screenWidth: screenWidth, recommendedIntake: recommendedIntake, intakeValue: intakeValue,),
            SizedBox(height: screenHeight * 0.01),
            Container(
              height: screenHeight * 0.21,
              width: screenWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 1, color: Colors.blue.shade200),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: waterIntake.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTileCard(waterIntake: waterIntake, index: index, hourNow: hourNow,timeNow: timeNow,);
                  },
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: screenHeight * .06,
                  width: screenWidth * .75,
                  child: ElevatedButton(onPressed: (){_clr();},style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent), child: Text("Reset All",style: TextStyle(color: Colors.white,fontSize: 20),),),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}