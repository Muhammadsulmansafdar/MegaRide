import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class History extends StatefulWidget {
  static const String idScreen = "history";
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("users").snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) return new Text("There is no user");
            return new ListView(children: getExpenseItems(snapshot));
          }),
    );
  }

  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.docs
        .map((doc) => InkWell(
          child: Card(
          child: new ListTile(title: Text("From: ${doc['pickUp']}"), subtitle: Text("To: ${doc['dropOff']}".toString()))
    ),
      onTap: ()=>print("this is printed"),
        )
    )
        .toList();
  }
}



/*ListTile(
dense: true,

title: SizedBox(height: 100,
child: Text("From: ${doc['pickUp']}")), subtitle: Text("To: ${doc['dropOff']}".toString()))*/
