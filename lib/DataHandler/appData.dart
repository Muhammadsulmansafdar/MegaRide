import 'package:flutter/material.dart';
import 'package:megaride/Models/address.dart';

class AppData extends ChangeNotifier
{
  Address pickUpLocation;

  void updatePickUpLocationAddress(Address pickUpAddress){
    pickUpLocation = pickUpAddress;
    notifyListeners();
  }
}