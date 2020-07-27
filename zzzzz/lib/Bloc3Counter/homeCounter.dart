import 'counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Single Flutter Bloc'),
        ),
        body: BlocProvider(
            create: (context) {
              return CounterBloc(CounterState(counter: 5));
            },
            child: blocbuilder()));
  }

  BlocBuilder<CounterBloc, CounterState> blocbuilder() {
    return BlocBuilder<CounterBloc, CounterState>(
      builder: (context, state) {
        return Center(
          child: Column(
            children: <Widget>[
              Text(
                state.counter.toString(),
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.thumb_up,
                        color: Colors.green,
                        size: 32,
                      ),
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context)
                            .add(CounterIncrement());
                      }),
                  IconButton(
                      icon: Icon(
                        Icons.thumb_down,
                        size: 32,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        BlocProvider.of<CounterBloc>(context)
                            .add(CounterDecrement());
                      })
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'counter_bloc.dart';

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Flutter BLoC"),
//         centerTitle: true,
//       ),
//       body: BlocBuilder(
//        // bloc: BlocProvider.of<CounterBloc>(context),
//         builder: (BuildContext context, state) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Text(
//                   state.counter.toString(),
//                   style: TextStyle(fontSize: 40),
//                 ),
//                 RaisedButton(
//                   child: Text("increment"),
//                   onPressed: () {
//                     BlocProvider.of<CounterBloc>(context).add(CounterIncrement());
//                   },
//                 ),
//                 RaisedButton(
//                   child: Text("decrement"),
//                   onPressed: () {
//                     BlocProvider.of<CounterBloc>(context).add(CounterDecrement());
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
