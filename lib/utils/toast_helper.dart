import 'package:flutter/material.dart';

extension ToastHelper on BuildContext{
  void showToast(String message) {
    final scaffold = ScaffoldMessenger.of(this);
    scaffold.showSnackBar(
      SnackBar(
        content:  Text('$message'),
        action: SnackBarAction(label: 'Ok', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}

