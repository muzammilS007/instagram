import 'package:flutter/material.dart';
import 'package:instagram/utils/text_field_validator.dart';

class PasswordCustomField extends StatelessWidget {
  final TextFieldValidator? textEditingController;
  final String? hintTxt;
  const PasswordCustomField({this.textEditingController,this.hintTxt});

  @override
  Widget build(BuildContext context) {

    return PasswordField(textEditingController: textEditingController,hintTxt: hintTxt,);
  }
}

class PasswordField extends StatefulWidget {
  final TextFieldValidator? textEditingController;
  final String? hintTxt;
   PasswordField({this.textEditingController,this.hintTxt});

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  var showPass=true;
  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
  }
  @override
  Widget build(BuildContext context) {
    final inputBorder =
    OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextFormField(
      controller: widget.textEditingController?.textEditingController,
      decoration: InputDecoration(
        suffixIcon: IconButton(onPressed: ()=>{
          setState(() {
            showPass=!showPass;
          })
        }, icon:showPass? Icon(Icons.remove_red_eye_sharp ):Icon(Icons.remove_red_eye_outlined)),
          errorText: widget.textEditingController?.validate != null
              ? widget.textEditingController?.validate
              : null,
          errorBorder:
          OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          hintText: '${widget.hintTxt}',
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: EdgeInsets.all(4)),
      obscureText: showPass,
    );
  }
}


