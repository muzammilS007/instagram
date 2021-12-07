import 'package:flutter/material.dart';
import 'package:instagram/utils/text_field_validator.dart';

class LoginViewModel with ChangeNotifier {
  TextFieldValidator emailOrUsername = TextFieldValidator();
  TextFieldValidator password = TextFieldValidator();

  @override
  void removeListener(VoidCallback listener) {
  }

  void initialise() {

  }

  void updateState(Function() movenext) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailOrUsername.text);
    if (!emailValid) {
      emailOrUsername.validate = "Invalid email";
      notifyListeners();
    } else if (password.text != "1234") {
      password.validate = "Wrong password";
      notifyListeners();
    }
    else{
      emailOrUsername.validate = null;
      password.validate = null;
      notifyListeners();
      movenext();
    }
  }

  @override
  void dispose() {
    emailOrUsername.dispose();
    password.dispose();
    super.dispose();
  }
}
