
import 'package:flutter/material.dart';
import 'package:instagram/utils/text_field_validator.dart';

class ChatViewModel with ChangeNotifier{
  TextFieldValidator txtmessage = new TextFieldValidator();
  List messageBulk =[];

  getMesList()
  {
    return messageBulk;
  }
  void addMessage()
  {
    if(txtmessage.text.isNotEmpty) {
      messageBulk.add(txtmessage.text.toString());
      notifyListeners();
      txtmessage.text="";
    }
  }

}