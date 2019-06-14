import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List locais = [
    "Porto Alegre",
    "Manaus",
    "Rio de Janeiro",
    "São Paulo",
    "Goias",
    "Paris",
    "Londres",
    "Frankfurt",
    "Spokane",
    "Inhambane",
    "São Francisco",
    "Curitiba",
    "Porto",
    "Milao",
    "Monaco",
    "Madrid",
    "California",
    "Washington"
  ];

  List<MaterialColor> cores =[
    Colors.orange,
    Colors.red,
    Colors.blue,
  ];

  String randomTexto = "";
  MaterialColor randomCor = Colors.blue;

  void _incrementCounter() {
    setState(() {
      randomTexto = locais[new Random().nextInt(locais.length)];
      randomCor = cores[new Random().nextInt(cores.length)];

    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
                onPressed: _incrementCounter,
                color: randomCor,
                child: Text('Clique!')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text(
                '$randomTexto',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
          ],
        ),
      ),
//      floatingActionButton: new FloatingActionButton(
//        onPressed: _incrementCounter,
//        tooltip: 'Increment',
//        child: new Icon(Icons.add),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
