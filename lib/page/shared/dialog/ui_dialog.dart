import 'package:flutter/material.dart';

class UIDialog<T> {
  String? title;
  String? description;
  String? mainButtonTitle;
  String? secondaryButtonTitle;
  bool? takesInput;
  Widget? child;
  String? hint;
  String? initialValue;
  Function({T? value})? callback;

  UIDialog(
      {this.title,
      this.child,
      this.takesInput = false,
      this.description,
      this.callback,
      this.hint,
      this.initialValue,
      this.secondaryButtonTitle,
      this.mainButtonTitle});
}

class UIBoolDialog extends UIDialog<bool> {
  UIBoolDialog({
    String? mainButtonTitle,
    String? cancelButtonTitle,
    required Function({bool? value}) callback,
    required String title,
    required String? description,
  }) : super(
            title: title,
            description: description,
            callback: callback,
            secondaryButtonTitle: cancelButtonTitle,
            mainButtonTitle: mainButtonTitle);
}

class UIStringDialog extends UIDialog<String> {
  UIStringDialog({
    String? hint,
    String? initialValue,
    String? mainButtonTitle,
    String? cancelButtonTitle,
    required Function({String? value}) callback,
    required String title,
    required String? description,
  }) : super(
            title: title,
            description: description,
            callback: callback,
            hint: hint,
            initialValue: initialValue,
            takesInput: true,
            secondaryButtonTitle: cancelButtonTitle,
            mainButtonTitle: mainButtonTitle);
}
