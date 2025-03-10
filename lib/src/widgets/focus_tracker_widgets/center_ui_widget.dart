import 'package:flutter/material.dart';
import 'package:tracking_app/src/widgets/focus_tracker_widgets/time_show_container.dart';

class CenterUI extends StatefulWidget {
  const CenterUI({super.key, required this.maxSecond, required this.currentSecond, required this.selectedHour, required this.selectedMinute, required this.selectedSecond});

  final int maxSecond;
  final int currentSecond;

  final int selectedHour;
  final int selectedMinute;
  final int selectedSecond;

  @override
  State<CenterUI> createState() => _CenterUIState();
}

class _CenterUIState extends State<CenterUI> {

  @override
  Widget build(BuildContext context) {
    return Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: 400,
            width: 400,
            child: CircularProgressIndicator(
              value: widget.currentSecond / widget.maxSecond,
              color: Colors.blue.shade400,
              strokeWidth: 20,
              backgroundColor: Colors.white,
              strokeCap: StrokeCap.round,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShowTime.buildTimerContainer(Text(
                  widget.selectedHour.toString(), // Updated dynamically
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  )
              ), "Hours"),
              SizedBox(width: 20),
              ShowTime.buildTimerContainer(Text(
                  widget.selectedMinute.toString(), // Updated dynamically
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  )
              ), "Minutes"),
              SizedBox(width: 20),
              ShowTime.buildTimerContainer(Text(
                  widget.selectedSecond.toString(), // Updated dynamically
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  )
              ), "Seconds"),
            ],
          ),
        ],
      );

  }
}
