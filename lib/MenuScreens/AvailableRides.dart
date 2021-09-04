import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'file:///D:/MegaXtudio/megaride/lib/MenuScreens/rideDetails.dart';
class AvailableRides extends StatefulWidget {
  static const String idScreen = "AvailableRides";
  @override
  _AvailableRidesState createState() => _AvailableRidesState();
}

class _AvailableRidesState extends State<AvailableRides> {
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
        child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("users").snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              } else return Container(
                child: getExpenseItems(snapshot),
              );
              /*ListView(children: getExpenseItems(snapshot));*/
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
                child: Text("From: ${doc['pickUp']}", style: TextStyle(
                  fontSize: 24.0,
                ),)), subtitle: Text("To: ${doc['dropOff']}", overflow: TextOverflow.visible,
          style: TextStyle(
            fontSize: 25.0,
          ),),),
        ),
      ),
      onTap: ()=>print("this is printed"),
    )
    )/*.toList()*/;
  }
}
