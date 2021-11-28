import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  final DateTime date;
  final String quoteText;
  bool isLiked = false;

  Note(this.date, this.quoteText, this.isLiked);

  factory Note.fromJson(
    Map<String, dynamic> json,
  ) {
    return Note((json['date'] as Timestamp).toDate(),
        json['quoteText'] as String, json['isLiked'] as bool);
  }
}

class AllNotes {
  final List<Note> notes;

  AllNotes(this.notes);

  factory AllNotes.fromJson(
    List<dynamic> json,
  ) {
    var x = json.map((record) => Note.fromJson(record)).toList();

    return AllNotes(x);
  }

  factory AllNotes.fromSnapshot(QuerySnapshot snapshot) {
    var x = snapshot.docs.map((record) {
      return Note.fromJson(record.data() as Map<String, dynamic>);
    }).toList();

    return AllNotes(x);
  }
}
