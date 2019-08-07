import 'package:flutter/material.dart';
import 'package:task/ui/task_screen.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TASK"),
        backgroundColor: Colors.black54,
      ),
      body: TaskScreen(),
    );
  }
}
