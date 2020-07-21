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
    return Container(
        child: Column(
      children: [
        TextField(
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Enter a search term',
              labelText: 'Enter foodnames'),
          onChanged: (value) {
            setState(() {
              foodname = value;
            });
          },
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          height: 50,
          width: 180,
          decoration: BoxDecoration(
              color: Colors.yellow[900],
              borderRadius: BorderRadius.circular(16)),
          child: FlatButton(
              onPressed: () {
                BlocProvider.of<FoodBloc>(context)
                    .add(FoodEvent.add(Food(foodname)));
              },
              child: Text(
                'Click',
                style: TextStyle(color: Colors.white70),
              )),
        )
      ],
    ));
  }
}
