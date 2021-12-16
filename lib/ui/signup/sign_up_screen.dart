import 'package:flutter/material.dart';
import 'package:instagram/ui/signup/sign_up_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SignUpScreen extends StatelessWidget {
  final signupviewmodel = SignUpViewModel();
   SignUpScreen({Key key}) : super(key: key);
 final StepperType stepperType = StepperType.vertical;



  @override
  Widget build(BuildContext context) {
    final inputBorder =
    OutlineInputBorder(borderSide: Divider.createBorderSide(context));
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
                  onStepTapped: (step) => {
                    viewmodel.tapped(step)
                  },
                  onStepContinue:
                  ()=>{
                    viewmodel.updateState(() => {
                        viewmodel.continued
                    })

                  },
                  onStepCancel: viewmodel.cancel,
                  steps: <Step>[
                    Step(
                      title: new Text('Account'),
                      content: Column(
                        children: <Widget>[
                          TextFormField(

                            controller: viewmodel.username.textEditingController,
                            decoration: InputDecoration(
                              errorText: viewmodel.username.validate != null
                                  ? viewmodel.username.validate
                                  : null,
                              errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              hintText: 'email or username',
                              border: inputBorder,
                              focusedBorder: inputBorder,
                              enabledBorder: inputBorder,
                              filled: true,
                              contentPadding: EdgeInsets.all(8),
                            ),
                            textAlign: TextAlign.start,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text,
                            autocorrect: false,
                          ),
                          Divider(height: 22,),
                          TextFormField(
                            controller: viewmodel.password.textEditingController,
                            decoration: InputDecoration(
                                errorText: viewmodel.password.validate != null
                                    ? viewmodel.password.validate
                                    : null,
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                hintText: 'password',
                                border: inputBorder,
                                focusedBorder: inputBorder,
                                enabledBorder: inputBorder,
                                filled: true,
                                contentPadding: EdgeInsets.all(8)),
                            obscureText: true,
                          ),
                          Divider(height: 22,),
                          TextFormField(
                            controller: viewmodel.cPassword.textEditingController,
                            decoration: InputDecoration(
                                errorText: viewmodel.cPassword.validate != null
                                    ? viewmodel.cPassword.validate
                                    : null,
                                errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red)),
                                hintText: 'Confirm Password',
                                border: inputBorder,
                                focusedBorder: inputBorder,
                                enabledBorder: inputBorder,
                                filled: true,
                                contentPadding: EdgeInsets.all(8)),
                            obscureText: true,
                          ),
                          Divider(height: 22,),
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

