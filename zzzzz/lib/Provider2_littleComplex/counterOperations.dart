import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//this is here class
import 'counterModel.dart';
//this is the other class we have taken
import '../Provider1_Simple/counterState.dart';

class OperationCounterLittleSimple extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('little Simple Provider'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: 500,
                  height: 120,
                  decoration: new BoxDecoration(
                      color: Colors.blue[200],
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(3, 3),
                            blurRadius: 4,
                            color: Colors.black38)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        context.watch<Counters>().values.toString(),
                        style: buildText(30),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            context.watch<CounterModel>().name,
                            style: buildText(26),
                          ),
                          Text(
                            context.watch<CounterModel>().salary.toString(),
                            style: buildText(14),
                          )
                        ],
                      ),
                      Text(
                        '\$' + context.watch<CounterModel>().jobs.toString(),
                        style: buildText(14),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Salary',
                      style: buildTextBlack(30),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          size: 40,
                          color: Colors.green,
                        ),
                        onPressed:
                            context.watch<CounterModel>().incrementSalary),
                    IconButton(
                        icon: Icon(
                          Icons.thumb_down,
                          size: 40,
                          color: Colors.red,
                        ),
                        onPressed:
                            context.watch<CounterModel>().decrememtSalary),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'ID',
                      style: buildTextBlack(30),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          size: 40,
                          color: Colors.green,
                        ),
                        onPressed: context.watch<Counters>().increment),
                    IconButton(
                        icon: Icon(
                          Icons.thumb_down,
                          size: 40,
                          color: Colors.red,
                        ),
                        onPressed: context.watch<Counters>().decrement)
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Jobs',
                      style: buildTextBlack(30),
                    ),
                    IconButton(
                        icon: Icon(
                          Icons.thumb_up,
                          size: 40,
                          color: Colors.green,
                        ),
                        onPressed: context.watch<CounterModel>().incrementJobs),
                    IconButton(
                        icon: Icon(
                          Icons.thumb_down,
                          size: 40,
                          color: Colors.red,
                        ),
                        onPressed: context.watch<CounterModel>().decrementJobs)
                  ],
                ),
              )
            ],
          ),
        ));
  }

  TextStyle buildText(double fontsize) {
    return TextStyle(
        fontSize: fontsize, fontWeight: FontWeight.bold, color: Colors.white);
  }

  TextStyle buildTextBlack(double fontsize) {
    return TextStyle(
        fontSize: fontsize, fontWeight: FontWeight.bold, color: Colors.black);
  }
}
