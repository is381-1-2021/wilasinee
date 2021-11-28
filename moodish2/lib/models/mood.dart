//import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:table_calendar/table_calendar.dart';

class Mood {
  final DateTime mood_date;
  final String mood;

  Mood(this.mood_date, this.mood);

  factory Mood.fromJson(
    Map<String, dynamic> json,
  ) {
    return Mood(
      (json['mood_date'] as Timestamp).toDate(),
      json['mood'] as String,
    );
  }
}

class AllMoods {
  final List<Mood> moods;

  AllMoods(this.moods);

  factory AllMoods.fromJson(
    List<dynamic> json,
  ) {
    var x = json.map((record) => Mood.fromJson(record)).toList();

    return AllMoods(x);
  }

  factory AllMoods.fromSnapshot(QuerySnapshot snapshot) {
    var x = snapshot.docs.map((record) {
      return Mood.fromJson(record.data() as Map<String, dynamic>);
    }).toList();

    return AllMoods(x);
  }
}


//class MoodTracker {
  //final String title;

  //const MoodTracker(this.title);

  //@override
  //String toString() => title;
//}

//final kEvents = LinkedHashMap<DateTime, List<MoodTracker>>(
  //equals: isSameDay,
//)..addAll(_kEventSource);

//final _kEventSource = Map.fromIterable(List.generate(50, (index) => index),
    //key: (item) => DateTime.utc(kFirstDay.year, kFirstDay.month, item),
    //value: (item) =>
        //List.generate(item, (index) => MoodTracker('item\'s $item')))
  //..addAll({
    //kToday: [
      //MoodTracker('Today\'s mood'),
    //],
  //});
//final kToday = DateTime.now();
//final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
//final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);