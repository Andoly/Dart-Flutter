import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(
  new Home(),
);

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Database'),
          backgroundColor: Colors.black38,
        ),
      ),
    );
  }
}


