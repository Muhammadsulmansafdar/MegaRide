import 'package:flutter/material.dart';
class DriverHistory extends StatefulWidget {
  static const String idScreen = "driverHistory";
  @override
  _DriverHistoryState createState() => _DriverHistoryState();
}

class _DriverHistoryState extends State<DriverHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "History"
        ),
      ),
    );
  }
}
