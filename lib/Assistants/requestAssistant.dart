import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
class RequestAssistant{
  static Future<dynamic> getRequest(String Url) async
  {
    try{
      http.Response response = await http.get(Uri.parse(Url));
      if(response.statusCode==200){
        String jSonData = response.body;
        var decodeData = convert.jsonDecode(jSonData);
        return decodeData;
      }
      else{
        return "failed";
      }
    }
    catch (exp){
      return "failed";
    }
  }
}