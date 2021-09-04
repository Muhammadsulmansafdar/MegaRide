import 'package:flutter/material.dart';
class DriverRideDetails extends StatefulWidget {
  static const String idScreen = "driverRideDetails";
  @override
  _DriverRideDetailsState createState() => _DriverRideDetailsState();
}

class _DriverRideDetailsState extends State<DriverRideDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Ride Details"
        ),
      ),
    );;
  }
}
