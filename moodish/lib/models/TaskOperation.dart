import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:midterm_app/models/Task.dart';
import 'package:midterm_app/pages/TaskEdit.dart';

class TasksOperation extends ChangeNotifier {
  List<Task> _tasks = [];

  List<Task> get getTasks {
    return _tasks;
  }

  //TasksOperation() {
  // addNewTask(
  //      'ไม่จำเป็นต้องแข่งขัน เพราะเรานั้นไม่ใช่ไก่','5 nov 2021', 'ความพยายามอยู่ที่ไหน');
  //}

  void addNewTask(String detail, String duedate, String headline) {
    Task task = Task(detail,DateTime.now(), headline);
    _tasks.add(task);
    notifyListeners();
  }
}
