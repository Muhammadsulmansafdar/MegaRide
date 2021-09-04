import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megaride/Config/config.dart';
import 'package:megaride/DataHandler/appData.dart';
import 'package:megaride/DriverApp/AllScreens/DriverMainScreen.dart';
import 'package:megaride/DriverApp/DriverRegistration/registrationScreen.dart';
import 'package:megaride/Home/mainScreen.dart';
import 'package:megaride/UserType/userType.dart';
import 'file:///D:/MegaXtudio/megaride/lib/SplashScreen/splashScreen.dart';
import 'package:megaride/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MegaRideApp.auth = FirebaseAuth.instance;
  MegaRideApp.sharedPreferences = await SharedPreferences.getInstance();
  MegaRideApp.firestore = FirebaseFirestore.instance;
  runApp(MyApp());
}

DatabaseReference userRef = FirebaseDatabase.instance.reference().child("users");
DatabaseReference driversRef = FirebaseDatabase.instance.reference().child("drivers");

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        title: 'Riders',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.green,
        ),
        /*home: SplashScreen(),*/
          initialRoute: FirebaseAuth.instance.currentUser == null ? SplashScreen.idScreen : mainScreen.idScreen,
        routes: getRoutes()
      ),
    );
  }
}



