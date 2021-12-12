import 'dart:async';

import 'package:my_app/models/MemFireb.dart';
import 'package:my_app/services/services.dart';

class MemController {
  final Services services;
  List<Memfireb> memfireb = List.empty();

  StreamController<bool> onSyncController = StreamController();
  Stream<bool> get onSync => onSyncController.stream;

  MemController(this.services);

  Future<List<Memfireb>> fetchMem() async {
    onSyncController.add(true);
    memfireb = await services.getMem();
    onSyncController.add(false);

    return memfireb;
  }
}
