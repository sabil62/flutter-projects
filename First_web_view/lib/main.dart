import 'package:First_web_view/food_form.dart';
import 'package:First_web_view/food_list.dart';
import 'package:flutter/material.dart';
import './myhomepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Homer());
  }
}

class Homer extends StatefulWidget {
  @override
  _HomerState createState() => _HomerState();
}

class _HomerState extends State<Homer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLOC pattern'),
      ),
      body: Column(
        children: [FoodForm()],
      ),
      floatingActionButton: FlatButton(
          onPressed: () {
            Navigator.push(context, new MaterialPageRoute(builder: (context) {
              return FoodList();
            }));
          },
          child: null),
    );
  }
}
