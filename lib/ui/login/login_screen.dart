import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:instagram/ui/login/login_screen_viewmodel.dart';
import 'package:instagram/ui/main_content/main_content_screen.dart';
import 'package:stacked/stacked.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      viewModelBuilder: () => LoginViewModel(),
      onModelReady: (viewModel) => viewModel.initialise(),
      builder: (context, viewModel, child) => loginUi(context, viewModel),
    );
  }
}

Widget loginUi(BuildContext context, [LoginViewModel viewModel]) {
  final inputBorder =
      OutlineInputBorder(borderSide: Divider.createBorderSide(context));
  return Scaffold(
    body: SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(
          children: [
            Flexible(
              child: Container(),
              flex: 1,
            ),
            SvgPicture.asset(
              'assets/icons/ic_instagram.svg',
              color: Theme.of(context).colorScheme.onBackground,
              height: 32,
            ),
            Flexible(
              child: Container(),
              flex: 1,
            ),
            Text(
              'Sign in and use more feature',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            SizedBox(
              height: 64,
            ),
            TextFormField(

              controller: viewModel.emailOrUsername.textEditingController,
              decoration: InputDecoration(
                errorText: viewModel.emailOrUsername.validate != null
                    ? viewModel.emailOrUsername.validate
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
            SizedBox(
              height: 24,
            ),
            TextFormField(
              controller: viewModel.password.textEditingController,
              decoration: InputDecoration(
                  errorText: viewModel.password.validate != null
                      ? viewModel.password.validate
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
            SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: ()=>{
                viewModel.updateState(() => {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => MainContent()))
                })
              },
              child: Container(
                child: Text(
                  'Sign in',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.white),
                ),
                width: double.infinity,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    gradient: LinearGradient(colors: [
                      Color(0xFF405de6),
                      Color(0xFF833ab4),
                      Color(0xFFe1306c),
                    ])),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Forgot for login details? get help signing in',
              style:
                  Theme.of(context).textTheme.bodyText1?.copyWith(fontSize: 10),
            ),
            Flexible(
              child: Container(),
              flex: 2,
            ),
            Container(
              child: Text(
                'Don\'t have an account? sign up',
                style: Theme.of(context).textTheme.bodyText1,
              ),
              padding: EdgeInsets.symmetric(vertical: 8),
            ),
          ],
        ),
      ),
    ),
  );
}
