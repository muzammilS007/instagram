import 'package:flutter/material.dart';
import 'package:instagram/repository/live_repository/auth.dart';
import 'package:instagram/utils/text_field_validator.dart';

class ForgetPassViewModel with ChangeNotifier{
 TextFieldValidator txtEmail = TextFieldValidator();

 txtChangeListner()
 {
  txtEmail.textEditingController.addListener(() {
        if(txtEmail.textEditingController.text.isEmpty)
         {
          notifyListeners();
         }
        else{
         notifyListeners();
        }
  });
 }

 sentLinkForChangePass(){
  var auth = Auth();
  auth.handleForgetPass(txtEmail.text);
 }


}