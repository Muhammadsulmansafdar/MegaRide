import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megaride/DriverApp/AllScreens/DriverAvailableRides.dart';
import 'package:megaride/DriverApp/AllScreens/DriverHistory.dart';
import 'package:megaride/DriverApp/AllScreens/DriverHomeScreen.dart';
import 'package:megaride/DriverApp/AllScreens/DriverProfileData.dart';

class DriverMainScreen extends StatefulWidget {
  static const String idScreen = "driverMainScreen";
  @override
  _DriverMainScreenState createState() => _DriverMainScreenState();
}

class _DriverMainScreenState extends State<DriverMainScreen> with SingleTickerProviderStateMixin
{


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
          DriverHomeScreen(),
          DriverAvailableRides(),
          DriverHistory(),
          DriverProfileData(),
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
