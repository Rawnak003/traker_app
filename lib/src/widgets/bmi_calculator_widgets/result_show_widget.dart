import 'package:flutter/material.dart';

class ResultShowWidget extends StatelessWidget {
  const ResultShowWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.output,
    required this.resColor
  });

  final double screenWidth;
  final double screenHeight;
  final String output;
  final Color resColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: resColor,
      shadowColor: Colors.grey,
      elevation: 8,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: SizedBox(
          width: screenWidth * .44,
          height: screenHeight * .17,
          child: Center(
            child: Text(
              output,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),
        ),
      ),
    );
  }
}
