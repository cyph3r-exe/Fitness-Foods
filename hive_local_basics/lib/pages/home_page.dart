import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //refernce the database in this file
  final _myBox = Hive.box('myBox');

  // function to read data
  void writeData() {
    _myBox.put(1, ['Debangshu', 18, 'Black']);
    _myBox.put(2, ['Roy', 19, 'Blue']);
    
  }

  // function to write data
  void readData() {
    print(_myBox.get(1));
  }

  //function to delete data
  void deleteData() {
    _myBox.delete(1);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          MaterialButton(onPressed: writeData,
          child: const Text('Write'),
          color: Colors.blue,
          ),

          MaterialButton(onPressed: readData,
          child: const Text('Read'),
          color: Colors.amber,
          ),

          MaterialButton(onPressed: deleteData,
          child: const Text('Delete'),
          color: Colors.red,
          ),
          
        ],
      ),
      ),
    );
  }
}