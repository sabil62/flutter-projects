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
    return Scaffold(
      body: Column(
        children: [
          BlocConsumer<FoodBloc, List<Food>>(
            //this <FoodBloc>
            buildWhen: (List<Food> previous, List<Food> current) {
              return true;
            },
            listenWhen: (List<Food> previous, List<Food> current) {
              if (current.length > previous.length) {
                return true;
              }

              return false;
            },
            builder: (context, foodlist) {
              return ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: foodlist.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        foodlist[index].foodname,
                        style: TextStyle(fontSize: 17),
                      ),
                      leading: Icon(
                        Icons.apps,
                        size: 16,
                        color: Colors.red,
                      ),
                      onTap: () {
                        BlocProvider.of<FoodBloc>(context) //that foodbloc
                            .add(FoodEvent.remove(index));
                      },
                    );
                  });
            },
            listener: (BuildContext context, foodList) {
              Scaffold.of(context).showSnackBar(
                SnackBar(content: Text('Added!')),
              );
            },
          ),
        ],
      ),
    );
  }
}
