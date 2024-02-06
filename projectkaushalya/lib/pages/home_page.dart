import 'package:flutter/material.dart';
import 'package:projectkaushalya/pages/health_initiative.dart';
import 'package:projectkaushalya/pages/health_precautions.dart';
import 'package:projectkaushalya/pages/health_schemes.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(221, 148, 216, 211),
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: Color.fromARGB(199, 148, 216, 211),
      ),
      drawer: const NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget> [
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ),
  );

  Widget buildHeader(BuildContext context) => Container(
    padding: EdgeInsets.only(
      top: MediaQuery.of(context).padding.top,
    ),
  );

  Widget buildMenuItems(BuildContext context) => Column(
    children: [
      ListTile(
        leading: const Icon(Icons.home_max_outlined),
        title: const Text('Home'),
        onTap: () => const HomePage(),
      ),
      ListTile(
        leading: const Icon(Icons.scanner_rounded),
        title: const Text('Health Schemes'),
        onTap: () => const HealthSchemes(),
      ),
      ListTile(
        leading: const Icon(Icons.back_hand_outlined),
        title: const Text('Health Precautions'),
        onTap: () => const HealthPrecautions(),
      ),
      ListTile(
        leading: const Icon(Icons.access_alarm_outlined),
        title: const Text('Health Initiatives'),
        onTap: () => const HealthInitiatives(),
      ),
    ],
  );
}

