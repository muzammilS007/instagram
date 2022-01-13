import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:instagram/ui/account/big_avatar_user_widget.dart';
import 'package:instagram/ui/signup/sign_up_viewmodel.dart';
import 'package:instagram/utils/constants.dart';
import 'package:instagram/utils/dialog_helper.dart';
import 'package:instagram/widgets/drop_down.dart';
import 'package:instagram/widgets/input_fields/password_field.dart';
import 'package:instagram/widgets/input_fields/text_field.dart';
import 'package:stacked/stacked.dart';

getNewActivity() async {
  try {
    var result = await Constants.platform
        .invokeMethod('startNewActivity')
        .then((value) => {print(value)});
    //print(result);
  } on PlatformException catch (e) {
    print(e.message);
  }
}

class SignUpScreen extends StatelessWidget {
  final signupViewmodel = SignUpViewModel();

  SignUpScreen({Key? key}) : super(key: key);
  final StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return ViewModelBuilder<SignUpViewModel>.reactive(
        viewModelBuilder: () => SignUpViewModel(),
        builder: (context, viewmodel, child) {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Text('Sign Up'),
              centerTitle: true,
            ),
            body: Container(
              child: Column(
                children: [
                  Expanded(
                    child: Stepper(
                      type: StepperType.vertical,
                      physics: ScrollPhysics(),
                      currentStep: viewmodel.currentStep,
                      onStepTapped: (step) => {viewmodel.tapped(step)},
                      onStepContinue: () => {
                        viewmodel.updateState(() => {
                              viewmodel.continued(),
                            })
                      },
                      onStepCancel: viewmodel.cancel,
                      steps: <Step>[
                        Step(
                          title: new Text('Account'),
                          content: Column(
                            children: <Widget>[
                              TextFieldCustom(
                                  textEditingController: viewmodel.email,
                                  hintTxt: Constants.labelEmail),
                              Divider(
                                height: 22,
                              ),
                              PasswordCustomField(
                                textEditingController: viewmodel.password,
                                hintTxt: Constants.labelPassword,
                              ),
                              Divider(
                                height: 22,
                              ),
                              PasswordCustomField(
                                textEditingController: viewmodel.cPassword,
                                hintTxt: Constants.labelConfirmPassword,
                              ),
                              Divider(
                                height: 22,
                              ),
                            ],
                          ),
                          isActive: viewmodel.currentStep >= 0,
                          state: viewmodel.currentStep >= 0
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                        Step(
                          title: new Text('Personal Info'),
                          content: Column(
                            children: <Widget>[
                              TextFieldCustom(
                                  textEditingController: viewmodel.name,
                                  hintTxt: Constants.labelName),
                              Divider(
                                height: 22,
                              ),
                              DropDownCustom(
                                items: ["Male", "Female"],
                                onClick: (value) =>
                                    {viewmodel.setGender(value)},
                              ),
                              /*            Text("Gender",),
                              componentRadioButton(context, viewmodel),*/
                              Divider(
                                height: 22,
                              ),
                              TextFieldCustom(
                                  showIcon: true,
                                  onClick: () => {},
                                  textEditingController: viewmodel.location,
                                  hintTxt: Constants.labelLocation),
                            ],
                          ),
                          isActive: viewmodel.currentStep >= 0,
                          state: viewmodel.currentStep >= 1
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                        Step(
                          title: new Text('Profile Pic'),
                          content: Center(
                            child: Column(
                              children: <Widget>[
                                BigAvatarUserWidget(
                                    height: 100.0,
                                    width: 100.0,
                                    click: () => {

                                      imagePickerDialog(context)
                                          //Todo method channel implemented here
                                   /*       if (Platform.isAndroid)
                                            {getNewActivity()}
                                          else
                                            {showMyDialog(context)}*/
                                          // MoveToDestinationAndRemoveStack(context).pushNavigation(CameraScreen()),
                                        }),
                                Padding(
                                  padding: EdgeInsets.only(top: 8),
                                  child: Text(
                                    "${viewmodel.name.text}",
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                )
                              ],
                            ),
                          ),
                          isActive: viewmodel.currentStep >= 0,
                          state: viewmodel.currentStep >= 2
                              ? StepState.complete
                              : StepState.disabled,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
