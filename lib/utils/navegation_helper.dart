import 'package:flutter/material.dart';

extension  MoveToDestinationAndRemoveStack on BuildContext{
   void moveDestination(dynamic destinationClass)
   {
     Navigator.of(this).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
     destinationClass), (Route<dynamic> route) => false);

   }
   void pushNavigation(dynamic destinationClass)
   {
     Navigator.push(this,
         MaterialPageRoute(builder: (context) => destinationClass));

   }

}