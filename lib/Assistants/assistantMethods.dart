import 'package:geolocator/geolocator.dart';
import 'package:megaride/Assistants/requestAssistant.dart';
import 'package:megaride/DataHandler/appData.dart';
import 'package:megaride/MapsCofig/configMaps.dart';
import 'package:megaride/Models/address.dart';
import 'package:provider/provider.dart';

class assistantMethods{
  static Future<String> searchCoordinateAddress(Position position, context) async{
    String placeAddress = "";

    String url = "https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=$mapKey";

    var response = await RequestAssistant.getRequest(url);

    if(response != "failed")
    {
    placeAddress = response["results"][0]["formatted_address"];

    Address userPickUpAddress = new Address();
    userPickUpAddress.longitude = position.longitude;
    userPickUpAddress.latitude = position.latitude;
    userPickUpAddress.placeName = placeAddress;

    Provider.of<AppData>(context, listen: false).updatePickUpLocationAddress(userPickUpAddress);
    }
    return placeAddress;
  }
}