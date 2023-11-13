import 'package:flutter/material.dart';
import 'package:to_do_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {

  //list of todo tasks
  List todoList = [
    ['Complete this tutorial', false]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 242, 128),
      appBar: AppBar(
        title: Text('To-Do'),
        elevation: 0,
      ),
      body: ListView.builder(itemBuilder: itemBuilder)
    );
  }
  
} 