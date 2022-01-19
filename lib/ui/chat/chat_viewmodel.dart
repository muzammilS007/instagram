import 'package:flutter/material.dart';
import 'package:instagram/data/model/messages.dart';
import 'package:instagram/repository/live_repository/database.dart';
import 'package:instagram/utils/constants.dart';
import 'package:instagram/utils/text_field_validator.dart';
import 'package:instagram/utils/time_helper.dart';

class ChatViewModel with ChangeNotifier {
  TextFieldValidator txtmessage = new TextFieldValidator();
  List messageBulk = [];
  var database = Database();

  getMesList() {
    return messageBulk;
  }


  void listListner() {
    database.firebaseDbListner((v) => {
    messageBulk.add(v),
        notifyListeners()
  });
  }

  void addMessage() {
    if (txtmessage.text.isNotEmpty) {
      var message = Messages(
          message: txtmessage.text.toString(),
          senderId: "123",
          receiverId: "234",
          userType: Constants.sender,
          fcmId: "",
          filePath: "",
          chatSessionId: "",
          dateTime: getCurrentTime()
      );
      database.create("", message, "messages");

      txtmessage.text = "";
    }
  }
}
