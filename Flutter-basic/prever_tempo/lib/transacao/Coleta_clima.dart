import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<Map> Coleta_clima(String appId, String cidade) async {
  String apiUrl = 'http://api.openweathermap.org/data/2.5/weather?q=?$cidade&appId='
      '${appId}&units= metric';
  http.Response response = await http.get(appId);

  if(response.statusCode == 200){
    return jsonDecode(response.body);
  }else{
    throw Exception("Falha");
  }

}