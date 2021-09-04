import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/MegaXtudio/megaride/lib/MenuScreens/AvailableRides.dart';
class rideDetails extends StatefulWidget {
  static const String idScreen = "rideDetails";
  @override
  _rideDetailsState createState() => _rideDetailsState();
}

class _rideDetailsState extends State<rideDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 229),
      appBar: AppBar(
        leading: Padding(
      padding: const EdgeInsets.only(top:12.0, left: 15),
          child: Container(
            width: 47,
            child: RawMaterialButton(
              shape: CircleBorder(),
              fillColor: Colors.white,
              onPressed: (){Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => AvailableRides()),
              );
              },
              child: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 255, 200, 87),
                size: 25.0,
              ),
              constraints: BoxConstraints.tightFor(
                width: 56.0,
                height: 56.0,
          ),
        ),
      ),
    ),
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 229, 229, 229),
        title: Padding(
          padding: const EdgeInsets.only(top:12.0),
          child: Center(
            child: Text(
              "Ride Details",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:35, right:15.0, left: 15.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right:20.0, left: 20.0),
                  child: Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text("7 August 2021, 12:00",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 117, 117, 117),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Divider(
                          color: Color.fromARGB(255, 229, 229, 229),
                          thickness: 3.0,
                        ),
                        Row(
                          children: [
                            Align(
                              /*alignment: Alignment.topRight,*/
                              child: Container(
                                child: SizedBox(
                                  height: 130,
                                  width: 50,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:12.0),
                                    child: Column(
                                      children: [
                                        Text("From",
                                          style: TextStyle(
                                            color: Colors.blueGrey,
                                          ),),
                                        Container(height: 70,
                                            child: VerticalDivider(
                                              color: Colors.black,
                                              thickness: 2.0,)),
                                        SizedBox(height: 4.0),
                                        Text("To",  style: TextStyle(
                                          color: Colors.blueGrey,
                                        ),),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left:12.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text("1, Jalalpur bhattian, street No 1",
                                        style: TextStyle(
                                          fontSize: 15.0,
                                        ),),
                                    ],
                                  ),
                                  SizedBox(height: 70.0),
                                  Row(children: [
                                    Text("Hafizabad, Street No 12",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),),
                                  ],)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                  "Car Details"
              ),
            ),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right:20.0, left: 20.0),
                child: Container(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
                        /*child: Align(
                          alignment: Alignment.topLeft,
                          child: Text("7 August 2021, 12:00",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 117, 117, 117),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold)),
                        ),*/
                      ),
                      /*Divider(
                        color: Color.fromARGB(255, 229, 229, 229),
                        thickness: 3.0,
                      ),*/
                      Row(
                        children: [
                          Align(
                            /*alignment: Alignment.topRight,*/
                            /*child: Container(
                              child: SizedBox(
                                height: 130,
                                width: 50,
                                child: Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Column(
                                    children: [
                                      Text("From",
                                        style: TextStyle(
                                          color: Colors.blueGrey,
                                        ),),
                                      Container(height: 70,
                                          child: VerticalDivider(
                                            color: Colors.black,
                                            thickness: 2.0,)),
                                      SizedBox(height: 4.0),
                                      Text("To",  style: TextStyle(
                                        color: Colors.blueGrey,
                                      ),),
                                    ],
                                  ),
                                ),
                              ),
                            ),*/
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            /*child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text("1, Jalalpur bhattian, street No 1",
                                      style: TextStyle(
                                        fontSize: 15.0,
                                      ),),
                                  ],
                                ),
                                SizedBox(height: 70.0),
                                Row(children: [
                                  Text("Hafizabad, Street No 12",
                                    style: TextStyle(
                                      fontSize: 15.0,
                                    ),),
                                ],)
                              ],
                            ),*/
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
