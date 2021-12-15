import 'package:flutter/material.dart';

class SignUpViewModel with ChangeNotifier{
  int currentStep = 0;

  tapped(int step){
    currentStep = step;
     notifyListeners();
  }

  continued(){
    currentStep < 2 ? currentStep += 1: null;
    notifyListeners();
  }
  cancel(){
    currentStep > 0 ?  currentStep -= 1 : null;
  }
}