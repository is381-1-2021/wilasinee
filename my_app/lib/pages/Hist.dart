import 'package:flutter/material.dart';
import 'package:my_app/controller/MemController.dart';
import 'package:my_app/models/Mem.dart';
import 'package:my_app/models/MemFireb.dart';
import 'package:my_app/models/MemOperation.dart';
import 'package:my_app/services/services.dart';

import 'package:provider/provider.dart';

class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  List<Memfireb> memfireb = List.empty();
  bool isLoading = false;
  var services = FirebaseServices();
  var controller;

  void initState() {
    super.initState();
    controller = MemController(services);

    controller.onSync.listen(
      (bool syncState) => setState(() => isLoading = syncState),
    );
  }

  void _getMem() async {
    var newMem = await controller.fetchMem();

    setState(() => memfireb = newMem);
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          itemCount: memfireb.isEmpty ? 1 : memfireb.length,
          itemBuilder: (ctx, index) {
            if (memfireb.isEmpty) {
              return Text('Tap button to fetch history');
            }
            return Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              height: 90,
              decoration: BoxDecoration(
                  color: Color(0xFFFFC392),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        memfireb[index].printnum, //5555555555
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF5F478C)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                ],
              ),
            );
          },
        );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("History"),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _getMem, //5555555555
          ),
        ],
      ),
      body: Consumer<MemOperation>(
        builder: (context, MemOperation data, child) {
          return ListView.builder(
            itemCount: data.getHistory.length,
            itemBuilder: (context, index) {
              return HistoryList(data.getHistory[index]);
            },
          );
        },
      ),
    );
  }
}

class HistoryList extends StatelessWidget {
  final Mem history;
  HistoryList(this.history);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      height: 90,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                history.shownum,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
