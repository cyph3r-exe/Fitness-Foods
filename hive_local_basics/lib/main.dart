import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_local_basics/pages/home_page.dart';
import 'package:hive/hive.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('myBox');

  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}