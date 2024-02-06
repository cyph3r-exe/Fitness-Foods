import 'package:flutter/material.dart';
import 'package:projectkaushalya/pages/health_initiative.dart';
import 'package:projectkaushalya/pages/health_precautions.dart';
import 'package:projectkaushalya/pages/health_schemes.dart';
import 'package:url_launcher/url_launcher.dart';

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
        backgroundColor: Color.fromARGB(199, 148, 216, 211)
      ),
      drawer: const NavigationDrawer(),
      body: const HomeBody(),
    );
  }
}

_firstURL() async {
   final Uri url = Uri.parse('https://timesofindia.indiatimes.com/life-style/health-fitness/health-news');
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
    }
}

_secondURL() async {
   final Uri url = Uri.parse('https://indianexpress.com/section/lifestyle/health/');
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
    }
}

_thirdURL() async {
   final Uri url = Uri.parse('https://www.livemint.com/science/health');
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
    }
}

_fourthURL() async {
   final Uri url = Uri.parse('https://www.indiatoday.in/health');
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
    }
}

_fifthURL() async {
   final Uri url = Uri.parse('https://www.medicalnewstoday.com/');
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
    }
}

_sixthURL() async {
   final Uri url = Uri.parse('https://www.nbcnews.com/health');
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
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

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
      child: Column(
        children: [
        _firstItem(),
        const SizedBox(height: 30),
        _secondItem(),
        const SizedBox(height: 30),
        _thirdItem(),
        const SizedBox(height: 30),
        _fourthItem(),
        const SizedBox(height: 30),
        _fifthItem(),
        const SizedBox(height: 30),
        _sixthItem()
      ]
      ),
      ),
    );
  }

  Widget _firstItem() {
    
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.blue,
      child:  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Times of India', 
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
              ),
            ),
            ElevatedButton(onPressed: _firstURL ,
            child: SizedBox(
              width: 20,
              height: 20,
              child: Text('Go', 
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
              ),
              ),
            )),
            
          ],
        ),
      ),
    );
  }

  Widget _secondItem() {
    
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.blue,
      child:  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('The Indian Express', 
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
              ),
            ),
            ElevatedButton(onPressed: _secondURL ,
            child: SizedBox(
              width: 20,
              height: 20,
              child: Text('Go', 
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
              ),
              ),
            )),
            
          ],
        ),
      ),
    );
  }

  Widget _thirdItem() {
    
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.blue,
      child:  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Live Mint', 
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
              ),
            ),
            ElevatedButton(onPressed: _thirdURL ,
            child: SizedBox(
              width: 20,
              height: 20,
              child: Text('Go', 
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
              ),
              ),
            )),
            
          ],
        ),
      ),
    );
  }

  Widget _fourthItem() {
    
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.blue,
      child:  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('India Today', 
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
              ),
            ),
            ElevatedButton(onPressed: _fourthURL ,
            child: SizedBox(
              width: 20,
              height: 20,
              child: Text('Go', 
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
              ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _fifthItem() {
    
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.blue,
      child:  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Medical News Today', 
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
              ),
            ),
            ElevatedButton(onPressed: _fifthURL ,
            child: SizedBox(
              width: 20,
              height: 20,
              child: Text('Go', 
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
              ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Widget _sixthItem() {
    
    return Container(
      width: double.infinity,
      height: 100,
      color: Colors.blue,
      child:  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('NBC News', 
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
              ),
            ),
            ElevatedButton(onPressed: _sixthURL ,
            child: SizedBox(
              width: 20,
              height: 20,
              child: Text('Go', 
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 10,
              ),
              ),
            )),
            
          ],
        ),
      ),
    );
  }


}