import 'package:flutter/material.dart';
import 'package:instagram/ui/forget_password/forget_pass_viewmodel.dart';
import 'package:instagram/utils/toast_helper.dart';
import 'package:instagram/widgets/input_fields/text_field.dart';
import 'package:stacked/stacked.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ForgetPassViewModel>.reactive(
      onModelReady: (v)=>{
        v.txtChangeListner()
      },
        viewModelBuilder: () => ForgetPassViewModel(),
        builder: (ctx, viewmodel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Forget Password"),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          "If you forget your password enter your email here we send you link in email for change your password"),
                    ),
                    TextFieldCustom(
                      textEditingController: viewmodel.txtEmail,
                      hintTxt: "Enter Email",
                    ),
                    ElevatedButton(
                        onPressed:
                            viewmodel.txtEmail.textEditingController.text.isEmpty ? null : () => {
                               viewmodel.sentLinkForChangePass(),
                               context.showToast("Forget pass link send to email")

                            },
                        child: Text("Send"))
                  ],
                ),
              ),
            ),
          );
        });
  }
}
