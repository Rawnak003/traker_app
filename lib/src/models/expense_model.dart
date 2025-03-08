import 'package:flutter/cupertino.dart';

class ExpenseModel {
  String category;
  String title;
  double amount;
  String date;
  IconData icon;

  ExpenseModel({
    required this.category,
    required this.title,
    required this.amount,
    required this.date,
    required this.icon,
  });
}
