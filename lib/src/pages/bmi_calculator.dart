import 'package:flutter/material.dart';
import 'package:tracking_app/src/widgets/bmi_calculator_widgets/result_show_widget.dart';
import '../widgets/bmi_calculator_widgets/custom_card_input_widget.dart';
import '../widgets/bmi_calculator_widgets/meter_show_widget.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _ftController = TextEditingController();
  final TextEditingController _inchController = TextEditingController();
  final TextEditingController _wtController = TextEditingController();

  double ans = 0;
  String res = "";
  Color color = Colors.white;
  _bmiCalculate(){
    double ft = double.tryParse(_ftController.text) ?? 0;
    double inch = double.tryParse(_inchController.text) ?? 0;
    double wt = double.tryParse(_wtController.text) ?? 0;

    double meter = ((ft * 12) + inch) * 0.0254;
    ans = wt / (meter * meter);

    setState(() {});

    _ftController.clear();
    _inchController.clear();
    _wtController.clear();
    _ageController.clear();
  }

  _showResult(double outPut){
    if(outPut >= 10 && outPut < 18.5){
      res = "Under Weighted";
    }else if(outPut >= 18.5 && outPut < 25){
      res = "Normal Weighted";
    }else if(outPut >= 25 && outPut < 30){
      res = "Over Weighted";
    }else if(outPut >= 30 && outPut < 35){
      res = "Obesity Class |";
    }else if(outPut >= 35 && outPut < 40){
      res = "Obesity Class ||";
    }else if(outPut >= 40 && outPut < 50) {
      res = "Obesity Class |||";
    }
    setState(() {

    });

  }
  _showColor(double outPut){
    if(outPut >= 10 && outPut < 18.5){
      color = Colors.blue;
    }else if(outPut >= 18.5 && outPut < 25){
      color = Colors.green;
    }else if(outPut >= 25 && outPut < 30){
      color = Colors.yellow;
    }else if(outPut >= 30 && outPut < 35){
      color = Colors.orange;
    }else if(outPut >= 35 && outPut < 40){
      color = Colors.deepOrange;
    }else if(outPut >= 40 && outPut < 50){
      color = Colors.redAccent.shade700;
    }
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade50,
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
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

      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MeterWidget(screenWidth: screenWidth, screenHeight: screenHeight, output: ans,),
                  ResultShowWidget(screenWidth: screenWidth, screenHeight: screenHeight, output: res,resColor: color,),
                ],
              ),
              SizedBox(height: screenHeight * .01),
              CustomCard(
                textController: _ageController,
                scHeight: screenHeight * .18,
                scWidth: screenWidth,
                title: "Age",
                label: "Enter your age",
              ),
              SizedBox(height: screenHeight * .01),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomCard(
                    textController: _ftController,
                    scHeight: screenHeight * .16,
                    scWidth: screenWidth * .44,
                    title: "Height (ft)",
                    label: "Height in feet",
                  ),
                  CustomCard(
                    textController: _inchController,
                    scHeight: screenHeight * .16,
                    scWidth: screenWidth * .44,
                    title: "Height (inch)",
                    label: "Height in inch",
                  ),
                ],
              ),
              SizedBox(height: screenHeight * .01),
              CustomCard(
                textController: _wtController,
                scHeight: screenHeight * .18,
                scWidth: screenWidth,
                title: "Weight (Kg)",
                label: "Weight in Kg",
              ),
              SizedBox(height: screenHeight * .01),
              SizedBox(
                height: screenHeight * .055,
                width: screenWidth,
                child: ElevatedButton(
                  onPressed: () {
                    _bmiCalculate();
                    FocusScope.of(context).unfocus();
                    _showResult(ans);
                    _showColor(ans);
                  },
                  style: ButtonStyle(
                    elevation: WidgetStatePropertyAll(10),
                    shape: WidgetStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Border radius of 10.0
                      ),
                    ),
                    backgroundColor: WidgetStateProperty.all(Colors.deepPurple.shade800),
                  ),
                  child: Text(
                    "Calculate",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}