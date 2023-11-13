import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {

  //declare the variables
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  ToDoTile({super.key, 
  required this.taskName, 
  required this.taskCompleted, 
  required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            //checkboz
            Checkbox(value: taskCompleted, onChanged: onChanged),
          //text inside the checkbox
            Text(taskName),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}