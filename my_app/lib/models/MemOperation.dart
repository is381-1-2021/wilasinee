import 'package:flutter/cupertino.dart';
import 'package:my_app/models/Mem.dart';

class MemOperation extends ChangeNotifier {
  List<Mem> _history = [];
  List<Mem> get getHistory {
    return _history;
  }

  HistoryOperation() {
    addNewHistory('There is no history yet');
  }

  void addNewHistory(String shownum) {
    Mem history = Mem(shownum);
    _history.add(history);
    notifyListeners();
  }
}
