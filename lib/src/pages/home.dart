import 'package:flutter/material.dart';
import 'package:tracking_app/src/pages/bmi_calculator.dart';
import 'package:tracking_app/src/pages/expense_tracker.dart';
import 'package:tracking_app/src/pages/fitness_tracker.dart';
import 'package:tracking_app/src/pages/focus_tracker.dart';
import 'package:tracking_app/src/pages/water_tracker.dart';
import 'package:tracking_app/src/widgets/home_widgets/category_show_widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: Text("Home",
          style: TextStyle(
            color: Colors.white,
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.deepPurple.shade800,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(12,28,12,20),
        child: GridView.count(
          mainAxisSpacing: screenHeight * 0.02,
          crossAxisSpacing: screenWidth * 0.02,
          crossAxisCount: 3,
          children: [
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => BMICalculator()));},
              child: CategoryShowWidgets(showIcon: Icons.speed_outlined, title: "BMI Calculator",color: Colors.indigoAccent,)),
            InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => FitnessTracker()));},
                child: CategoryShowWidgets(showIcon: Icons.directions_bike_outlined, title: "Fitness Tracker", color: Colors.green.shade700,)),
            InkWell(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => WaterTracker()));},
                child: CategoryShowWidgets(showIcon: Icons.water_drop_outlined, title: "Water Tracker",color: Colors.blueAccent,)),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => ExpenseTracker()));},
              child: CategoryShowWidgets(showIcon: Icons.monetization_on_outlined, title: "Expense Tracker", color: Colors.red.shade600,)),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => FocusTracker()));},
              child: CategoryShowWidgets(showIcon: Icons.watch_later_outlined, title: "Focus Tracker",color: Colors.deepPurple,)),
          ]
        ),
      )
    );
  }
}