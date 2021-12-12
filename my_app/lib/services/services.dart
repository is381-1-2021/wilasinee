import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_app/models/MemFireb.dart';

abstract class Services {
  Future<List<Memfireb>> getMem();
}

class FirebaseServices extends Services {
  @override
  Future<List<Memfireb>> getMem() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('liew_final').get();

    var all = AllMemfireb.fromSnapshot(snapshot);
    return all.memfireb;
  }
}
