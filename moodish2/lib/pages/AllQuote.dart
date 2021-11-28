//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:midterm_app/controllers/note_controller.dart';
import 'package:midterm_app/models/Note.dart';
import 'package:midterm_app/models/NotesOperation.dart';
import 'package:midterm_app/services/services.dart';
import 'package:provider/provider.dart';

class AllQuote extends StatefulWidget {
  @override
  _AllQuoteState createState() => _AllQuoteState();
}

class _AllQuoteState extends State<AllQuote> {
  List<Note> notes = List.empty();
  bool isLoading = false;
  var services = FirebaseServices();
  var controller;
  bool newState = false;
  var newDate = '';
  var newQuote = '';

  Color buttonColor = Colors.grey;

  void initState() {
    super.initState();
    controller = NoteController(services);

    controller.onSync.listen(
      (bool syncState) => setState(() => isLoading = syncState),
    );
  }

  void _getNotes() async {
    var newNotes = await controller.fetchNotes();

    setState(() => notes = newNotes);
  }

  void changeColor() {
    TextEditingController quoteText = new TextEditingController();
    Map<String, dynamic> data = {
      "quoteText": quoteText.text,
      "date": DateTime.now(),
      "isLiked": bool
    };
    if (data == false) {
      buttonColor = Colors.red;
      newState = true;
      //newQuote = '${notes[index].quoteText}';

      //Map<String, dynamic> data = {
      //  "isLiked": true,
      //};
      //FirebaseFirestore.instance
      //    .collection("wilasinee_test")
      //    .add(data)
      //    .then((value) => print("Favorited"))
      //    .catchError((error) => print("Failed to add favorite"));
      //_getNotes();
    } else {
      buttonColor = Colors.grey;
      Map<String, dynamic> data = {
        "isLiked": false,
      };
      //FirebaseFirestore.instance
      //    .collection("wilasinee_test")
      //    .add(data)
      //    .then((value) => print("Remove Favorited"))
      //    .catchError((error) => print("Failed to remove favorite"));
      //_getNotes();
    }
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: notes.isEmpty ? 1 : notes.length,
          itemBuilder: (ctx, index) {
            if (notes.isEmpty) {
              return Text('Tap button to fetch notes');
            }
            return Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              height: 120,
              decoration: BoxDecoration(
                  color: Color(0xFFFFC392),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      '${notes[index].date.toString().substring(0, notes[index].date.toString().lastIndexOf(':'))}',
                      style: TextStyle(color: Colors.black)),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        notes[index].quoteText,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF5F478C)),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(
                              Icons.star,
                              color: buttonColor,
                              size: 25,
                            ),
                            onPressed: () {
                              setState(() {
                                changeColor();
                              });
                            },
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                ],
              ),
            );
          },
        );
  //UI ของมิดเทอม
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/9');
          },
          child: Icon(
            Icons.add,
            size: 30,
          ),
        ),
        appBar: AppBar(
          title: Text('All your quote'),
          actions: [
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                _getNotes();
              },
            ),
          ],
        ),
        body: Center(child: body)
        //Consumer<NotesOperation>(
        //  builder: (context, NotesOperation data, child) {
        //    return ListView.builder(
        //      itemCount: data.getNotes.length,
        //      itemBuilder: (context, index) {
        //        return NotesCard(data.getNotes[index]);
        //      },
        //    );
        //  },
        //),
        );
  }
}






    //ar newNotes = await controller.fetchNotes();

    //setState(() => notes = newNotes);
  