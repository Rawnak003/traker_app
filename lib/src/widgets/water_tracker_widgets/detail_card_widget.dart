import 'package:flutter/material.dart';
class DetailsCard extends StatelessWidget {
  const DetailsCard({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
    required this.recommendedIntake,
    required this.intakeValue,
  });
  final double recommendedIntake;
  final double intakeValue;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.grey,
      elevation: 8,
      surfaceTintColor: Colors.white,
      child: SizedBox(
        height: screenHeight * 0.15,
        width: screenWidth,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: screenWidth * .43,
                height: screenHeight * .12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Water Intake:",
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: screenWidth * .05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$intakeValue mL",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * .06,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                width: screenWidth * .43,
                height: screenHeight * .12,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Remaining:",
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: screenWidth * .05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "${recommendedIntake - intakeValue} mL",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * .06,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}