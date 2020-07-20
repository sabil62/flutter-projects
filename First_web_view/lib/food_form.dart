import 'BLOC/bloc/food_bloc.dart';
import 'BLOC/events/foodevent.dart';
import 'BLOC/model/food.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodForm extends StatefulWidget {
  @override
  _FoodFormState createState() => _FoodFormState();
}

class _FoodFormState extends State<FoodForm> {
  String foodname;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TextField(
        onChanged: (value) {
          setState(() {
            foodname = value;
          });
        },
      ),
      FlatButton(
          onPressed: () {
            BlocProvider.of(context).add(FoodEvent.add(Food(foodname)));
          },
          child: Icon(Icons.ac_unit))
    ]);
  }
}
