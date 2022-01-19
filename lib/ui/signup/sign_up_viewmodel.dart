import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram/data/model/signup_model.dart';
import 'package:instagram/repository/live_repository/auth.dart';
import 'package:instagram/repository/live_repository/database.dart';
import 'package:instagram/utils/text_field_validator.dart';
import 'package:instagram/utils/time_helper.dart';

class SignUpViewModel with ChangeNotifier {
  int currentStep = 0;

  // for account info
  TextFieldValidator password = TextFieldValidator();
  TextFieldValidator cPassword = TextFieldValidator();
  TextFieldValidator email = TextFieldValidator();

  //for personal info
  TextFieldValidator name = TextFieldValidator();
  TextFieldValidator location = TextFieldValidator();
  String? gender;

  // for user pic
  String? imagePath;

  //firebase firestore class
  Database? _database;

  setGender(String gender) {
    this.gender = gender;
    notifyListeners();
  }

  setImagePath(String imagePath) {
    this.imagePath = imagePath;
    notifyListeners();
  }

  tapped(int step) {
    currentStep = step;
    notifyListeners();
  }

  continued(Function finished) {
    if (currentStep < 2) {
      currentStep += 1;

      notifyListeners();
    } else {
      finished();
    }
  }

  cancel() {
    currentStep > 0 ? currentStep -= 1 : null;
  }

  void updateState(Function() moveNext) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email.text);
    if (!emailValid) {
      email.validate = "Invalid email";
      notifyListeners();
      return;
    } else if (password.text.isEmpty) {
      password.validate = "Password Field cannot be empty";
      email.validate = null;
      notifyListeners();
      return;
    } else if (cPassword.text.isEmpty) {
      cPassword.validate = "Confirm Password Field cannot be empty";
      email.validate = null;
      password.validate = null;
      notifyListeners();
      return;
    } else {
      email.validate = null;
      password.validate = null;
      cPassword.validate = null;
      notifyListeners();
      moveNext();
    }
  }

  void signUp(Function(String) response) {
    var auth = new Auth();
    var signUp ;
    auth
        .handleSignUp(email.text.toString(), password.text.toString())
        .then((value) => {
          signUp = SignUp(
              firstName: name.text,
              email: email.text,
              userId: value.uid,
              dateTime: getCurrentTime(),
              location: location.text
          ),
              _database = Database(),
              _database?.create(
                  value.uid,signUp
                  ),
              response(value.uid)
            });
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    cPassword.dispose();
    super.dispose();
  }
}
