import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:megaride/Assistants/requestAssistant.dart';
import 'package:megaride/DataHandler/appData.dart';
import 'package:megaride/MapsCofig/configMaps.dart';
import 'package:megaride/Models/placePredictions.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var pickUp = "";
  var dropOff = "";
  TextEditingController pickUpTextEditingController = TextEditingController();
  TextEditingController dropOffTextEditingController = TextEditingController();
  List<PlacePredictions> placePredictionList = [];

  @override
  Widget build(BuildContext context) {
    /*String placeAddress = Provider.of<AppData>(context).pickUpLocation.placeName ?? '';
    pickUpTextEditingController.text = placeAddress;*/

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    return Scaffold(
      body: Column(
          children:<Widget> [
            Container(
              height: 250.0,
              /*width: double.infinity,*/
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 4.0,
                    spreadRadius: 0.1,
                    offset: Offset(0.7,0.7),
                  ),
                ]
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 40),
              child: Column(
                children: [
                  SizedBox(height: 5.0,),
                  Stack(
                    children: [
                      GestureDetector(
                          child: Icon(Icons.arrow_back),
                        onTap: (){
                            Navigator.pop(context);
                        },
                      ),
                      Center(
                        child: Text(
                          "Search drop off",
                          style: TextStyle(
                            fontSize: 18.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0,),
                  Row(
                    children: [
                      Icon(Icons.location_on,color: Color.fromARGB(255, 255, 200, 87),),
                      SizedBox(height: 16.0),
                      Expanded(
                        child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(3.0),
                          child: TextField(
                            controller: pickUpTextEditingController,
                            decoration: InputDecoration(
                              hintText: "Pickup Location",
                              fillColor: Colors.grey[400],
                              filled: true,
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.only(left: 11.0, top: 8.0, bottom: 8.0),
                            ),
                            onChanged: (value)
                            {
                              pickUp = value;
                            },
                          ),
                        ),
                      ),),
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Row(
                    children: [
                      Icon(Icons.location_on,),
                      SizedBox(height: 16.0),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[400],
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: TextField(
                              onChanged: (value){
                                /*findPlace(val); yh bd mein uncommet krna hai*/
                                dropOff = value;
                              },
                              controller: dropOffTextEditingController,
                              decoration: InputDecoration(
                                hintText: "Drop me at",
                                fillColor: Colors.grey[400],
                                filled: true,
                                border: InputBorder.none,
                                isDense: true,
                                contentPadding: EdgeInsets.only(left: 11.0, top: 8.0, bottom: 8.0),

                              ),

                            ),
                          ),
                        ),),
                    ],
                  ),
                  SizedBox(height: 5.0,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    /*  minimumSize: Size(100, 40),*/
                      primary: Color.fromARGB(255, 255, 200, 87), //background color of button
                      elevation: 2, //elevation of button
                    ),
                    onPressed: () {
                      users
                          .add({'pickUp': pickUp, 'dropOff': dropOff}).then((value) => dropOffTextEditingController.clear())
                          .then((value) => print('Location Submitted'))
                          .catchError((error) => print("Failded to add location: $error"));
                    },
                    child: Text("Save",
                      style: TextStyle(
                        fontSize: 18.0,
                      ),),
                  ),
                ],
              ),
              ),
            ),
            //tiles for predictions
            SizedBox(height: 10.0,),
            (placePredictionList.length > 0)
                ? Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: ListView.separated(
                padding: EdgeInsets.all(0.0),
                itemBuilder: (context, index)
                {
                  return PredictionTile(placePredictions: placePredictionList[index],);
                },
                separatorBuilder: (BuildContext context, int index) => Divider(),
                itemCount: placePredictionList.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
              ),
            )
                :Container(),

          ],
        ),
    );
  }
  void findPlace(String placeName) async
  {
    if(placeName.length > 1)
    {
      String autoCompleteUrl = "https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$placeName&key=$mapKey&sessiontoken=1234567890&components=country:pk";

      var res = await RequestAssistant.getRequest(autoCompleteUrl);

      if(res == "failed"){
        return;
      }

      if(res["status"] == "OK"){
         var predictions = res["predictions"];

         var placesList = (predictions as List).map((e) => PlacePredictions.fromJson(e)).toList();

         setState(() {
           placePredictionList = placesList;
         });
      }

      /*print("Place Predictions :: ");
      print(res);*/
    }
  }
}

class PredictionTile extends StatelessWidget
{
  final PlacePredictions placePredictions;

  PredictionTile({Key key, this.placePredictions}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(width: 10.0,),
          Row(
            children: [
              Icon(Icons.add_location),
              SizedBox(width: 14.0,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8.0,),
                    Text(placePredictions.main_text, overflow: TextOverflow.ellipsis, style: TextStyle(
                      fontSize: 16.0,
                    ),),
                    SizedBox(height: 2.0,),
                    Text(placePredictions.secondary_text, overflow: TextOverflow.ellipsis, style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey,
                    ),),
                    SizedBox(height: 8.0,),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(width: 10.0,),
        ],
      ),
    );
  }
}
