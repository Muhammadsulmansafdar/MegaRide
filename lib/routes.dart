import 'package:megaride/DriverApp/AllScreens/DriverMainScreen.dart';
import 'package:megaride/DriverApp/AllScreens/carInfoScreen.dart';
import 'package:megaride/DriverApp/DriverLogin/DriverLogin.dart';
import 'package:megaride/DriverApp/DriverRegistration/registrationScreen.dart';
import 'package:megaride/Home/homeScreen.dart';
import 'package:megaride/Home/mainScreen.dart';
import 'package:megaride/Login/loginScreen.dart';
import 'package:megaride/MenuScreens/AvailableRides.dart';
import 'package:megaride/MenuScreens/History.dart';
import 'package:megaride/MenuScreens/profiledata.dart';
import 'package:megaride/RegistrationScreens/registerationScreen.dart';
import 'package:megaride/SplashScreen/splashScreen.dart';
import 'package:megaride/UserType/userType.dart';

getRoutes(){
  return{
    History.idScreen: (context)=>History(),
    AvailableRides.idScreen: (context)=>AvailableRides(),
    profiledata.idScreen: (context)=>profiledata(),
    RegisterationScreen.idScreen: (context)=>RegisterationScreen(),
    SplashScreen.idScreen: (context)=>SplashScreen(),
    loginScreen.idScreen: (context)=>loginScreen(),
    mainScreen.idScreen: (context)=>mainScreen(),
    userType.idScreen: (context)=>userType(),
    driverReg.idScreen: (context)=>driverReg(),
    homeScreen.idScreen: (context)=>homeScreen(),
    DriverLogin.idScreen: (context)=>DriverLogin(),
    CarInfoScreen.idScreen: (context)=>CarInfoScreen(),
    DriverMainScreen.idScreen: (context)=>DriverMainScreen(),
  };
}