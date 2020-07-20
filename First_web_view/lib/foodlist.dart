import 'BLOC/bloc/food_bloc.dart';
import 'BLOC/events/foodevent.dart';
import 'BLOC/model/food.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodList extends StatefulWidget {
  @override
  _FoodListState createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (BuildContext context, foodlist) {
        return ListView.builder(
          itemCount: foodlist.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(foodlist[index].name),
            );
          },
        );
      },
      listener: (BuildContext context, state) {
        null;
      },
    );
  }
}
