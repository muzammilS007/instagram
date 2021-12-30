import 'package:flutter/material.dart';
import 'package:instagram/ui/signup/sign_up_viewmodel.dart';

Widget componentRadioButton(
    BuildContext context, dynamic signUpViewModel) {
  List groupValue = ["Male", "Female"];
  String value;
  return Column(
    children: <Widget>[
      for (int i = 0; i <= 1; i++)
        ListTile(
            title: Text(
              '${groupValue[i]}',
            ),
            leading: Radio(
                value: value,
                groupValue: groupValue,
                onChanged: (v) => {
                  if (v[i] == "Male")
                    {signUpViewModel.setGender("Male")}
                  else
                    {signUpViewModel.setGender("Female")}
                })),
    ],
  );
}