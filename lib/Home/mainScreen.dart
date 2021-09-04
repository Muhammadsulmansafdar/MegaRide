import 'file:///D:/MegaXtudio/megaride/lib/MenuScreens/AvailableRides.dart';
import 'file:///D:/MegaXtudio/megaride/lib/MenuScreens/History.dart';
import 'file:///D:/MegaXtudio/megaride/lib/MenuScreens/profiledata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///D:/MegaXtudio/megaride/lib/Home/homeScreen.dart';

class mainScreen extends StatefulWidget {
  static const String idScreen = "mainScreen";

  @override
  _mainScreenState createState() => _mainScreenState();
}

class _mainScreenState extends State<mainScreen> with SingleTickerProviderStateMixin {

  TabController tabController;
  int selectedIndex = 0;
  void onItemClicked(int index){
    setState(() {
      selectedIndex = index;
      tabController.index = selectedIndex;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    tabController = TabController(length: 4, vsync: this);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: tabController,
        children: [
          homeScreen(),
          AvailableRides(),
          History(),
          profiledata(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: "Available Rides",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web_asset_outlined),
            label: "History",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: "Profile",
          ),
        ],
        unselectedItemColor: Colors.black,
        selectedItemColor: Color.fromARGB(255, 255, 200, 87),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: selectedIndex,
        onTap: onItemClicked,
      ),
    );
  }
}
