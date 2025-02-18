import 'package:flutter/material.dart';

class CategoryShowWidgets extends StatelessWidget {
  const CategoryShowWidgets({
    super.key,
    required this.showIcon,
    required this.title,
    required this.color,

  });
  final String title;
  final Color color;
  final IconData showIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.deepPurpleAccent),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            showIcon,
            size: 50,
            color: color,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}