import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

//https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_hour.geojson
Map _dados;
List _features;

    void main() async {
      _dados = await pegaTerremotos();
      _features = _dados['features'];

      runApp(new MaterialApp(
        home: Terremoto(),
      ));
    }

    class Terremoto extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text('Terremotos'),
              backgroundColor: Color(0xFF0BA0E3),
            ),
            body: Center(
                child: ListView.builder(
                    itemCount: _features.length,
                    padding: const EdgeInsets.all(15.5),
                    itemBuilder: (BuildContext context, int posicao) {

                      initializeDateFormatting("pt_BR", null);
                      var formt = new DateFormat.yMMMd("pt_BR");

                      var data = formt.format(
                          new DateTime.fromMicrosecondsSinceEpoch(
                              _features[posicao]['properties']['time'] * 1000));
                      return Column(
                        children: <Widget>[
                          Divider(
                            height: 5.5,
                          ),
                          ListTile(
                            title: Text(
                              "$data",
                              style: TextStyle(
                                  fontSize: 15.5,
                                  color: Color(0xFF2900FA),
                                  fontWeight: FontWeight.w500),
                            ),
                            subtitle: Text(
                              "${_features[posicao]['properties']['place']}",
                              style: TextStyle(
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic),
                            ),

                            leading: CircleAvatar(
                              backgroundColor: Colors.greenAccent,
                              child: Text(
                                "${_features[posicao]['properties']['mag']}",
                                style: TextStyle(
                                    fontSize: 16.5,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontStyle: FontStyle.normal),
                              ),
                            ),
                            onTap: () {
                              mostrarMensagem(context, "${_features[posicao]['properties']['title']}");
                            },
                          ),
                        ],
                      );
                    }))
        );
      }

      void mostrarMensagem(BuildContext context, String mensagem) {
        var alert = new AlertDialog(
          title: Text('Terramotos'),
          content: Text(mensagem),
          actions: <Widget>[
            FlatButton(onPressed: () => Navigator.pop(context),
                child: Text('OK'))
          ],
        );
        showDialog(context: context, builder: (_){
          return alert;
        });
      }
    }

    Future<Map> pegaTerremotos() async{
      String url = 'https://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/all_day.geojson';
          http.Response response = await http.get(url);
          return json.decode(response.body);
    }
