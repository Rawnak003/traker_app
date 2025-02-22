import 'package:flutter/material.dart';

class ListTileCard extends StatelessWidget {
  const ListTileCard({
    super.key,
    required this.waterIntake,
    required this.index,
    required this.hourNow,
    required this.timeNow,
  });

  final List<int> waterIntake;
  final int index;
  final List<int> hourNow;
  final List<int> timeNow;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.lightBlueAccent.shade100,
      margin: EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Icon(Icons.water_drop_sharp, color: Colors.blue.shade900),
        ),
        title: Text(
          '${waterIntake[index]} mL',
          style: TextStyle(
            color: Colors.blue.shade900,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Text(
          "${hourNow[index]}:${timeNow[index]}",
          style: TextStyle(
            color: Colors.blue.shade900,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}