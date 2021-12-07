import 'package:flutter/material.dart';

class TextFieldValidator {
  final TextEditingController textEditingController = TextEditingController();
  String validate;
  dynamic extraValue;
  final bool optional;
  final toolTipKey = GlobalKey();

  TextFieldValidator({this.optional = false});

  String get text {
    return textEditingController.text;
  }

  set text(String value) {
    textEditingController.text = value;
  }

  dispose() {
    textEditingController.dispose();
  }

  setText(String text) {
    textEditingController.text = text;
  }

  updateTip() {
    showTip(validate != null);
  }

  showTip(bool show) {
    if (toolTipKey == null) return;
    final dynamic tooltip = toolTipKey.currentState;
    try {
      if (show) {
        tooltip.ensureTooltipVisible();
      } else {
        tooltip.deactivate();
      }
    } catch (e) {} finally {}
  }

  resetValidator() {
    text = "";
    validate = null;
  }
}