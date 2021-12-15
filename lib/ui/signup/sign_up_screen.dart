import 'package:flutter/material.dart';
import 'package:instagram/ui/signup/sign_up_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SignUpScreen extends StatelessWidget {
  final signupviewmodel = SignUpViewModel();
   SignUpScreen({Key key}) : super(key: key);
 final StepperType stepperType = StepperType.vertical;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignUpViewModel>.reactive(viewModelBuilder: ()=>SignUpViewModel(), builder: (context,viewmodel,child){
      return   Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Sign Up'),
          centerTitle: true,
        ),
        body:  Container(
          child: Column(
            children: [
              Expanded(
                child: Stepper(
                  type: StepperType.horizontal,
                  physics: ScrollPhysics(),
                  currentStep: viewmodel.currentStep,
                  onStepTapped: (step) => viewmodel.tapped(step),
                  onStepContinue:  viewmodel.continued,
                  onStepCancel: viewmodel.cancel,
                  steps: <Step>[
                    Step(
                      title: new Text('Account'),
                      content: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Email Address'),
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Password'),
                          ),
                        ],
                      ),
                      isActive: viewmodel.currentStep >= 0,
                      state: viewmodel.currentStep >= 0 ?
                      StepState.complete : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Address'),
                      content: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Home Address'),
                          ),
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Postcode'),
                          ),
                        ],
                      ),
                      isActive: viewmodel.currentStep >= 0,
                      state: viewmodel.currentStep >= 1 ?
                      StepState.complete : StepState.disabled,
                    ),
                    Step(
                      title: new Text('Mobile Number'),
                      content: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Mobile Number'),
                          ),
                        ],
                      ),
                      isActive:viewmodel.currentStep >= 0,
                      state: viewmodel.currentStep >= 2 ?
                      StepState.complete : StepState.disabled,
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

