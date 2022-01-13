import 'package:flutter/material.dart';

Widget imageWithText(Widget icon,String title) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [

      IconButton(
      onPressed: () => {},
      icon: icon,
    ),
      Text("$title")

    ],
  );
}

extension  ImageWithText on Widget{
   imageWithText(String title,Function onClick) {
    return InkWell(
      onTap: ()=>{
        onClick()
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          IconButton(
            onPressed: () => {},
            icon: this,
          ),
          Text("$title")

        ],
      ),
    );
  }

}