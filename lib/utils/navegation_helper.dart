import 'package:flutter/material.dart';

extension  MoveToDestinationAndRemoveStack on BuildContext{
   void moveDestination(dynamic destinationClass)
   {
     Navigator.of(this).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
     destinationClass), (Route<dynamic> route) => false);

   }


}