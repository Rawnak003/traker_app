import 'package:flutter/material.dart';

class ShowTime{
  static buildTimerContainer(Text text, String s){
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 85,
          width: 85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: text,
        ),
        SizedBox(height: 15,),
        Text(s,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),)
      ],
    );
  }
}