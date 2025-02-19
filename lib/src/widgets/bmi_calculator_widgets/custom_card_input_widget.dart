import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.textController,
    required this.scHeight,
    required this.scWidth,
    required this.title,
    required this.label

  });
  final TextEditingController textController;
  final String title;
  final String label;
  final double scWidth;
  final double scHeight;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.grey,
      elevation: 8,
      surfaceTintColor: Colors.white,
      child: SizedBox(
        height: scHeight,
        width: scWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10.0,10.0,10.0,15.0),
              child: TextFormField(
                controller: textController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: label,
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(width: 3, color: Colors.deepPurple.shade800),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}