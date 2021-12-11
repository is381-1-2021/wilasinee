import 'package:flutter/cupertino.dart';

import 'Note.dart';

class HistoryModel extends ChangeNotifier {
  //String? _savenum;
  //String? _shownum;
  //get shownum => this._shownum;
  //set shownum(value) {
  //  this._shownum = value;
  //  notifyListeners();
  //}

  //get savenum => this._savenum;
  //set savenum(value) {
  //  this._savenum = value;
  //  notifyListeners();
  //}

  List<Note> _history = [];
  List<Note> get getHistory {
    return _history;
  }

  HistoryOperation() {
    addNewHistory('There is no history yet');
  }

  void addNewHistory(String shownum) {
    Note history = Note(shownum);
    _history.add(history);
    notifyListeners();
  }
}
