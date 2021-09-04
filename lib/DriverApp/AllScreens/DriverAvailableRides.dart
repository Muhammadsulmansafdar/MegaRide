import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class DriverAvailableRides extends StatefulWidget {
  static const String idScreen = "driverAvailableRides";
  @override
  _DriverAvailableRidesState createState() => _DriverAvailableRidesState();
}

class _DriverAvailableRidesState extends State<DriverAvailableRides> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 229, 229, 229),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 229, 229, 229),
          title: Padding(
            padding: const EdgeInsets.only(top:40.0),
            child: Text(
              "Available",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Container(
          child: new StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance.collection("drivers").snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return Text("There is no Record");
                return ListView(children: getExpenseItems(snapshot));
              }),
        )
    );
  }
  getExpenseItems(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data.docs
        .map((doc) => InkWell(
      child: Container(
        height: 200,
        /*width:MediaQuery.of(context).size.width,*/
        child: Card(child: ListTile(
          dense: true,
          title: SizedBox(height: 130,
              child: Text("From: ${doc['from']}", style: TextStyle(
                fontSize: 24.0,
              ),)), subtitle: Text("To: ${doc['to']}", overflow: TextOverflow.visible,
          style: TextStyle(
            fontSize: 25.0,
          ),),),
        ),
      ),
      onTap: ()=>print("this is printed"),
    )
    ).toList();
  }
}
