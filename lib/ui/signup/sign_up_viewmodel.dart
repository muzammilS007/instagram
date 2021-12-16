import 'package:flutter/material.dart';
import 'package:instagram/utils/text_field_validator.dart';

class SignUpViewModel with ChangeNotifier {
  int currentStep = 0;
  TextFieldValidator password = TextFieldValidator();
  TextFieldValidator cPassword = TextFieldValidator();
  TextFieldValidator username = TextFieldValidator();

  tapped(int step) {
    currentStep = step;
    notifyListeners();
  }

  continued() {
    currentStep < 2 ? currentStep += 1 : null;
    notifyListeners();
  }

  cancel() {
    currentStep > 0 ? currentStep -= 1 : null;
  }

  void updateState(Function() movenext) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(username.text);
    if (!emailValid) {
      username.validate = "Invalid email";
      notifyListeners();
      return;
    } else if (password.text.isEmpty) {
      password.validate = "Password Field cannot be empty";
      username.validate = null;
      notifyListeners();
      return;
    } else if (cPassword.text.isEmpty) {
      cPassword.validate = "Confirm Password Field cannot be empty";
      username.validate = null;
      password.validate = null;
      notifyListeners();
      return;
    } else {
      username.validate = null;
      password.validate = null;
      cPassword.validate = null;
      notifyListeners();
      movenext();
    }
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    cPassword.dispose();
    super.dispose();
  }
}
