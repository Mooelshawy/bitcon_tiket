
import 'dart:convert';

import 'package:http/http.dart' as http;


class NetworkingHelper{

NetworkingHelper({required this.url});

 final  String url ;


  Future<dynamic> getDataFromNetwork() async {

    var responseData = await http.get(Uri.parse(url));
    if (responseData.statusCode == 200) {
     
   var decoderJson = jsonDecode(responseData.body);
    
   return decoderJson ;
} else {
  print('something is wrong try again ');
}
  }
}