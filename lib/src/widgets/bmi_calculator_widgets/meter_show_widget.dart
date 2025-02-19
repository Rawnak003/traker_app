import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class MeterWidget extends StatelessWidget {
  const MeterWidget({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.output,
  });

  final double screenWidth;
  final double screenHeight;
  final double output;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.grey,
      elevation: 8,
      surfaceTintColor: Colors.white,
      child: SizedBox(
        width: screenWidth * .44,
        height: screenHeight * .18,
        child: SfRadialGauge(
          title: GaugeTitle(
            text: 'BMI',
            textStyle: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          axes: <RadialAxis>[
            RadialAxis(
              minimum: 10,
              maximum: 50,
              ranges: <GaugeRange>[
                GaugeRange(
                  startValue: 10,
                  endValue: 18.5,
                  color: Colors.blue,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 18.5,
                  endValue: 25,
                  color: Colors.green,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 25,
                  endValue: 30,
                  color: Colors.yellow,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 30,
                  endValue: 35,
                  color: Colors.orange,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 35,
                  endValue: 40,
                  color: Colors.deepOrange,
                  startWidth: 10,
                  endWidth: 10,
                ),
                GaugeRange(
                  startValue: 40,
                  endValue: 50,
                  color: Colors.red,
                  startWidth: 10,
                  endWidth: 10,
                ),
              ],
              pointers: <GaugePointer>[NeedlePointer(value: output)],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Text(
                    output.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  angle: 90,
                  positionFactor: 0.65,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
