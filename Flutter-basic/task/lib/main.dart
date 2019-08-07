import 'package:flutter/material.dart';
import 'package:task/ui/home.dart';
import 'package:task/ui/task_screen.dart';

void main() => runApp(new Task());

class Task extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarefas',
      home: Home(),
    );
  }
}


