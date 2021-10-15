import 'package:flutter/material.dart';

class FormModel extends ChangeNotifier {
  String? _message;
  get message => this._message;

  set message(value) {
    this._message = value;
    notifyListeners();
  }
}
