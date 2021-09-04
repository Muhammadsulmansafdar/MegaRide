import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:megaride/Assistants/assistantMethods.dart';
import 'package:megaride/DriverApp/AllScreens/DriverSearchScreen.dart';
import 'package:megaride/Home/searchScreen.dart';

class DriverHomeScreen extends StatefulWidget {
  static const String idScreen = "driverHomeScreen";
  @override
  _DriverHomeScreenState createState() => _DriverHomeScreenState();
}

class _DriverHomeScreenState extends State<DriverHomeScreen> {

  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newGoogleMapController;

  Position currentPosition;
  var geoLocator = Geolocator();
  double bottomPaddingOfMap = 0;

  void locatePosition()async{
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    LatLng latLngPosition = LatLng(position.latitude, position.longitude);
    CameraPosition cameraPosition =  new CameraPosition(target: latLngPosition, zoom: 14);
    newGoogleMapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String address = await assistantMethods.searchCoordinateAddress(position, context);
    print("This is your address :: "+ address);
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mega",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 47,
              child: RawMaterialButton(
                shape: CircleBorder(),
                fillColor: Colors.white,
                onPressed: (){
                  /*Navigator.pushNamedAndRemoveUntil(context, loginScreen.idScreen, (route) => false);*/
                },
                child: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                  size: 25.0,
                ),
              ),
            ),
          ), //IconButton
        ], //<Widget>[]
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            GoogleMap(
              padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              zoomControlsEnabled: true,
              zoomGesturesEnabled: true,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller)
              {
                setState(() {
                  bottomPaddingOfMap = 265.0;
                });
                _controllerGoogleMap.complete(controller);
                newGoogleMapController = controller;
                locatePosition();
              },
            ),

            Positioned(
              left: 0.0,
              right: 0.0,
              bottom: 110.0,
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0,),
                child: Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius:10.0,
                        spreadRadius: 0.2,
                        offset: Offset(0.7,0.7),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10.0,),
                        Container(decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 6.0,
                              spreadRadius: 0.5,
                              offset: Offset(0.7,0.7),
                            ),
                          ],
                        ),
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>DriverSearchScreen()));
                            },
                            child: SizedBox(
                              height: 50,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left:8.0),
                                    child: Icon(Icons.location_on,  color: Color.fromARGB(255, 255, 200, 87),),
                                  ),
                                  SizedBox(height: 20.0,
                                    width: 10.0,),
                                  Text(
                                    "Search drop off",
                                  ),
                                ],
                              ),
                            ),
                          ),),
                        SizedBox(
                          height: 50,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left:8.0),
                                child: Icon(Icons.location_on,  color: Colors.grey),
                              ),
                              SizedBox(height: 20.0,
                                width: 10.0,),
                              Text(
                                "Drop me at",
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 60.0),
            Container(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                child: Container(
                  height: 55.0,
                  decoration: BoxDecoration(
                    color:  Color.fromARGB(255, 255, 200, 87),
                  ),
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left:100.0),
                          child: Text(
                            '        Proceed',
                            style: TextStyle(color: Colors.white,
                                fontSize: 18.0),
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            //Ride start krny k liye jo popup aye ga yh hai, isko maps on krny k bd uncmmnt krna hai
            /*Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                height: 220,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 16.0,
                      spreadRadius: 0.5,
                      offset: Offset(0.7,0.7),
                    )
                  ]
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 17.0),
                  child: Column(
                    children: [
                      Container(
                        height: 45.0,
                        width: double.infinity,
                        color: Colors.yellow,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16,),
                          child: Row(
                            children: [
                              Icon(Icons.directions_car),
                              SizedBox(width:23.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Car", style: TextStyle(
                                      fontSize: 18.0,
                                    ),
                                    ),
                                    Text(
                                      "10KM", style: TextStyle(
                                      fontSize: 16.0, color: Colors.grey,
                                    ),
                                    ),
                                  ],
                                )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0,),
                       Padding(
                         padding: EdgeInsets.symmetric(horizontal: 20.0),
                         child: Row(
                           children: [
                             Icon(FontAwesomeIcons.moneyCheckAlt,
                             size: 16.0, color: Colors.black54,),
                             SizedBox(width: 20.0),
                             Text("Cash"),
                             SizedBox(width: 6.0,),
                             Icon(Icons.keyboard_arrow_down, color: Colors.black54, size: 16.0,),
                           ],
                         ),
                       ),
                      SizedBox(
                        height:24.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: RaisedButton(
                          onPressed: (){
                            print("clicked");
                          },
                          color: Theme.of(context).accentColor,
                          child: Padding(
                            padding:EdgeInsets.all(17.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Request", style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black54,),
                                ),
                                Icon(FontAwesomeIcons.taxi, color: Colors.white, size: 24.0,),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
