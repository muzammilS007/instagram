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

extension  MoveToDestinationAndRemoveStack1 on dynamic{
  void moveDestination(BuildContext context)
  {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
    this), (Route<dynamic> route) => false);

  }
  void pushNavigation(BuildContext context)
  {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => this));

  }

}