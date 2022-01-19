import 'package:flutter/material.dart';
import 'package:instagram/repository/live_repository/auth.dart';
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
    } else if (password.text.isEmpty) {
      password.validate = "Password Field can't be empty";
      notifyListeners();
    }
    else{
      emailOrUsername.validate = null;
      password.validate = null;
      notifyListeners();
      movenext();
    }
  }

  signIn(Function(Map) res)
  {
    Map<String, Object?> data;
    var auth = new Auth();
    auth.handleSignInEmail(emailOrUsername.text,password.text).then((value) =>
    {
      data={
        "uid":value.uid,
        "email" : value.email
      },
      res(data)

    });
  }

  @override
  void dispose() {
    emailOrUsername.dispose();
    password.dispose();
    super.dispose();
  }
}
