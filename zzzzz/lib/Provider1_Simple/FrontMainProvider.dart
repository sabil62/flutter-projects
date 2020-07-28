import './operationProvider.dart';

import 'counterState.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FrontMainProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Counters>(
      create: (BuildContext context) {
        return Counters();
      },
      child: OperationCounterProvider(),
    );
  }
}
