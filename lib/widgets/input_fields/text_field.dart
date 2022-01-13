import 'package:flutter/material.dart';
import 'package:instagram/utils/text_field_validator.dart';

class TextFieldCustom extends StatelessWidget {
  final TextFieldValidator? textEditingController;
  final String? hintTxt;
  final Function? onClick;
  final  showIcon;

  TextFieldCustom(
      {this.textEditingController, this.hintTxt, this.showIcon, this.onClick});

  @override
  Widget build(BuildContext context) {
    final inputBorder =
        OutlineInputBorder(borderSide: Divider.createBorderSide(context));
    return TextFormField(
      controller: textEditingController?.textEditingController,
      decoration: InputDecoration(
          suffixIcon: Visibility(
            visible: showIcon ?? false,
            child: IconButton(
                onPressed: () => {onClick!()}, icon: Icon(Icons.location_on)),
          ),
          errorText: textEditingController?.validate != null
              ? textEditingController?.validate
              : null,
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          hintText: '$hintTxt',
          border: inputBorder,
          focusedBorder: inputBorder,
          enabledBorder: inputBorder,
          filled: true,
          contentPadding: EdgeInsets.all(4)),
    );
  }
}
