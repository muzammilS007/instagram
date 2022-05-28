import 'package:flutter/material.dart';

extension ReplaceString on String{
  String replaceExtra()
  {
   return this.replaceAll(" (BST)", "");
  }
}

extension TimeOfDayExtension on TimeOfDay {
  int compareTo(TimeOfDay other) {
    if (hour < other.hour) return -1;
    if (hour > other.hour) return 1;
    if (minute < other.minute) return -1;
    if (minute > other.minute) return 1;
    return 0;
  }
}