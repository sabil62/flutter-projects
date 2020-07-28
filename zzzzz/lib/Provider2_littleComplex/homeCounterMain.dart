import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zzzzz/Provider2_littleComplex/counterModel.dart';
import 'counterOperations.dart';
import '../Provider1_Simple/counterState.dart';

class HomeCounterSimpleMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterModel(),
        ),
        //this down is irrelevant just to see
        ChangeNotifierProvider(
          create: (context) => Counters(),
        )
      ],
      child: OperationCounterLittleSimple(),
    );
  }
}
