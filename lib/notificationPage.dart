import 'package:flutter/material.dart';
import 'file:///D:/MegaXtudio/megaride/lib/MenuScreens/profiledata.dart';
class notification extends StatefulWidget {
  @override
  _notificationState createState() => _notificationState();
}

class _notificationState extends State<notification> {
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
                MaterialPageRoute(builder: (context) => profiledata()),
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
              "Notifications",
              style: TextStyle(
                color: Colors.black,
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
