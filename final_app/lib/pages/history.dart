import 'package:final_app/models/Note.dart';
import 'package:final_app/models/history_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("History")),
      body: Consumer<HistoryModel>(
        builder: (context, HistoryModel data, child) {
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
  final Note history;
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
