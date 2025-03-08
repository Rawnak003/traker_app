
import 'package:flutter/material.dart';


class Utils{
  static snackBar(String message, context){
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),));
  }
}