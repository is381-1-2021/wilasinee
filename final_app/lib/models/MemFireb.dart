import 'package:cloud_firestore/cloud_firestore.dart';

class Memfireb {
  final String printnum;

  Memfireb(this.printnum);

  factory Memfireb.fromJson(
    Map<String, dynamic> json,
  ) {
    return Memfireb(json['printnum'] as String);
  }
}

class AllMemfireb {
  final List<Memfireb> memfireb;

  AllMemfireb(this.memfireb);

  factory AllMemfireb.fromJson(
    List<dynamic> json,
  ) {
    var x = json.map((record) => Memfireb.fromJson(record)).toList();

    return AllMemfireb(x);
  }

  factory AllMemfireb.fromSnapshot(QuerySnapshot snapshot) {
    var x = snapshot.docs.map((record) {
      return Memfireb.fromJson(record.data() as Map<String, dynamic>);
    }).toList();

    return AllMemfireb(x);
  }
}
