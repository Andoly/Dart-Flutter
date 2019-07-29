import 'dart:async';


Future<Map> Coleta_clima(String appId, String Cidade) async {
  String apiUrl = 'http://api.openweathermap.org/data/2.5/weather?q=?$Cidade&appId='
      '${appId}&units=imperial';
}