import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counterState.dart';

class OperationCounterProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countersss = Provider.of<Counters>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Practice'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer<Counters>(
              builder: (context, counter, child) => Text(
                counter.values.toString(),
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
            ),
            IconButton(
                icon: Icon(
                  Icons.thumb_up,
                  size: 38,
                  color: Colors.green,
                ),
                onPressed: countersss.increment),
            IconButton(
                icon: Icon(
                  Icons.thumb_down,
                  color: Colors.red,
                  size: 38,
                ),
                onPressed: countersss.decrement),
          ],
        ),
      ),
    );
  }
}
