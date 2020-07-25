import 'package:flutter/material.dart';
import 'package:zzzzz/Bloc2/studentHome.dart';
import 'package:zzzzz/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Stream Bloc Pattern', home: MyHomeApp());
  }
}

class MyHomeApp extends StatefulWidget {
  @override
  _MyHomeAppState createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('bloc pattern simple'),
      ),
      body: Text(
        'Click on drawers to access the need class',
        style: TextStyle(
            fontSize: 33, color: Colors.red, fontWeight: FontWeight.w700),
      ),
      drawer: Drawer(
        child: ListView(children: [
          ListTile(
            leading: Icon(
              Icons.ac_unit,
              size: 24,
              color: Colors.red,
            ),
            title: Text('Employee Bloc Stream'),
            onTap: () => Navigator.push(context,
                new MaterialPageRoute(builder: (context) => HomePage())),
          ),
          ListTile(
            leading: Icon(
              Icons.access_alarm,
              size: 24,
              color: Colors.amberAccent,
            ),
            title: Text('Student Bloc Stream'),
            onTap: () => Navigator.push(context,
                new MaterialPageRoute(builder: (context) {
              return HomeStudent();
            })),
          ),
        ]),
      ),
    );
  }
}
