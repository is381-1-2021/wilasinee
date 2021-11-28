import 'package:flutter/cupertino.dart';
import 'package:midterm_app/models/Note.dart';

class NotesOperation extends ChangeNotifier {
  List<Note> _status = [];

  List<Note> get getNotes {
    return _status;
  }

  NotesOperation() {
    _status.clear();
    addStatus('', '', false);
  }

  void addStatus(String quoteText, String date, bool isLiked) {
    Note updateStatus = Note(DateTime.now(), quoteText, isLiked);
    _status.add(updateStatus);
    notifyListeners();
  }
}
