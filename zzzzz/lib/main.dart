import 'package:flutter/material.dart';
import 'package:zzzzz/Bloc2/studentHome.dart';
import 'package:zzzzz/Bloc3Counter/homeCounter.dart';
import 'package:zzzzz/Provider1_Simple/FrontMainProvider.dart';
import 'package:zzzzz/Provider2_littleComplex/homeCounterMain.dart';
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
          SizedBox(
            height: 25,
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
          SizedBox(
            height: 25,
          ),
          ListTile(
            leading: Icon(
              Icons.accessibility,
              size: 24,
              color: Colors.green,
            ),
            title: Text('flutter Bloc counter'),
            onTap: () => Navigator.push(context,
                new MaterialPageRoute(builder: (context) {
              return HomeCounter();
            })),
          ),
          SizedBox(
            height: 25,
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.accessibility,
          //     size: 27,
          //     color: Colors.brown,
          //   ),
          //   title: Text('flutter PROVIDER counter'),
          //   onTap: () => Navigator.push(context,
          //       new MaterialPageRoute(builder: (context) {
          //     return HomeMainCounterProvider();
          //   })),
          // ),
          SizedBox(
            height: 25,
          ),
          ListTile(
            leading: Icon(
              Icons.cloud_upload,
              size: 24,
              color: Colors.pink,
            ),
            title: Text('flutter PROVIDER ANOTHER counter'),
            onTap: () => Navigator.push(context,
                new MaterialPageRoute(builder: (context) {
              return FrontMainProvider();
            })),
          ),
          SizedBox(
            height: 25,
          ),
          ListTile(
            leading: Icon(
              Icons.loupe,
              size: 26,
              color: Colors.indigo,
            ),
            title: Text('flutter PROVIDER ANOTHER counter'),
            onTap: () => Navigator.push(context,
                new MaterialPageRoute(builder: (context) {
              return HomeCounterSimpleMain();
            })),
          ),
        ]),
      ),
    );
  }
}
