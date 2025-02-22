import 'package:flutter/material.dart';
class ProgressCard extends StatelessWidget {
  const ProgressCard({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.intakeValue,
    required this.recommendedValue,
  });

  final double recommendedValue;
  final double intakeValue;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.grey,
      elevation: 8,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.blue.shade50,
          width: screenWidth,
          height: screenHeight * .2,
          child: Center(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: screenHeight * 0.2,
                      width: screenWidth * 0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.expand,
                          children: [
                            CircularProgressIndicator(
                              value: intakeValue / recommendedValue,
                              color: Colors.blue.shade400,
                              strokeWidth: 20,
                              backgroundColor: Colors.white,
                              strokeCap: StrokeCap.round,
                            ),
                            Center(
                              child: Image(
                                image: AssetImage("assets/water_tracker/water.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Align(
                              alignment: Alignment(0, 0.3),
                              child: Text(
                                "${((intakeValue * 100)/recommendedValue).toInt()}%",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()
                                    ..style = PaintingStyle.stroke
                                    ..strokeWidth = 2
                                    ..color = Colors.black, // Outline color
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment(0, 0.3),
                              child: Text(
                                "${((intakeValue * 100)/recommendedValue).toInt()}%",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white, // Inner text color
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('"Water is\nLife"',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: screenWidth * .053,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(
                            height: screenHeight * .01,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(width: 2, color: Colors.grey),
                            ),
                            height: screenHeight * 0.1,
                            width: screenWidth * 0.4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Recommended:',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * .04,
                                      color: Colors.blueAccent
                                  ),
                                ),
                                Text(
                                  '$recommendedValue mL/D',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * .05,
                                      color: Colors.black
                                  ),
                                ),
                              ],
                            ),
                          )
                        ]
                    )
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}