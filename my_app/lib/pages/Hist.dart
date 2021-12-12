import 'package:flutter/material.dart';
import 'package:my_app/models/Mem.dart';
import 'package:my_app/models/MemOperation.dart';

import 'package:provider/provider.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("History")),
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
