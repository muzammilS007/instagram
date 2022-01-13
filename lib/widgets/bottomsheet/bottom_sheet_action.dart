import 'package:flutter/cupertino.dart';

class BottomSheetAction {
  static const TAG = 'BottomSheetAction';

  IconData? iconData;

  String? title;

  int? id;

  Color colors;

  BottomSheetAction({
     this.iconData,
     this.title,
     this.id,
    this.colors= const Color(0xFF030303)
  });
}