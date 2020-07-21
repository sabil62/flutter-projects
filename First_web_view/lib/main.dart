import 'package:First_web_view/BLOC/bloc/food_bloc.dart';
import 'package:First_web_view/BLOC/model/food.dart';
import 'package:First_web_view/food_form.dart';
import 'package:First_web_view/food_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './BLOC/bloc/food_observer.dart';
//import './myhomepage.dart';

void main() {
  Bloc.observer = FoodObserver();
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
  List<Food> get initialState => null;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FoodBloc>(
      create: (BuildContext context) => FoodBloc(initialState),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BLOC pattern'),
        ),
        body: Column(
          children: [
            FoodForm(),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 100,
              color: Colors.red,
            )
          ],
        ),
        floatingActionButton: FlatButton(
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return FoodList();
              }));
            },
            child: Icon(
              Icons.camera,
              size: 49,
              color: Colors.green,
            )),
      ),
    );
  }
}

// import 'dart:async';

// import 'package:flutter/material.dart';

// import 'package:flutter_bloc/flutter_bloc.dart';

// class SimpleBlocObserver extends BlocObserver {
//   @override
//   void onEvent(Bloc bloc, Object event) {
//     print(event);
//     super.onEvent(bloc, event);
//   }

//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     print(transition);
//     super.onTransition(bloc, transition);
//   }

//   @override
//   void onError(Bloc bloc, Object error, StackTrace stackTrace) {
//     print(error);
//     super.onError(bloc, error, stackTrace);
//   }
// }

// void main() {
//   Bloc.observer = SimpleBlocObserver();
//   runApp(App());
// }

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => ThemeBloc(),
//       child: BlocBuilder<ThemeBloc, ThemeData>(
//         builder: (_, theme) {
//           return MaterialApp(
//             title: 'Flutter Demo',
//             home: BlocProvider(
//               create: (_) => CounterBloc(),
//               child: CounterPage(),
//             ),
//             theme: theme,
//           );
//         },
//       ),
//     );
//   }
// }

// class CounterPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Counter')),
//       body: BlocBuilder<CounterBloc, int>(
//         builder: (_, count) {
//           return Center(
//             child: Text(
//               '$count',
//               style: const TextStyle(fontSize: 24.0),
//             ),
//           );
//         },
//       ),
//       floatingActionButton: Column(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0),
//             child: FloatingActionButton(
//               child: const Icon(Icons.add),
//               onPressed: () =>
//                   context.bloc<CounterBloc>().add(CounterEvent.increment),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0),
//             child: FloatingActionButton(
//               child: const Icon(Icons.remove),
//               onPressed: () =>
//                   context.bloc<CounterBloc>().add(CounterEvent.decrement),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0),
//             child: FloatingActionButton(
//               child: const Icon(Icons.brightness_6),
//               onPressed: () => context.bloc<ThemeBloc>().add(ThemeEvent.toggle),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 5.0),
//             child: FloatingActionButton(
//               backgroundColor: Colors.red,
//               child: const Icon(Icons.error),
//               onPressed: () => context.bloc<CounterBloc>().add(null),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// enum CounterEvent { increment, decrement }

// class CounterBloc extends Bloc<CounterEvent, int> {
//   CounterBloc() : super(0);

//   @override
//   Stream<int> mapEventToState(CounterEvent event) async* {
//     switch (event) {
//       case CounterEvent.decrement:
//         yield state - 1;
//         break;
//       case CounterEvent.increment:
//         yield state + 1;
//         break;
//       default:
//         addError(Exception('unsupported event'));
//     }
//   }
// }

// enum ThemeEvent { toggle }

// class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
//   ThemeBloc() : super(ThemeData.light());

//   @override
//   Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
//     switch (event) {
//       case ThemeEvent.toggle:
//         yield state == ThemeData.dark() ? ThemeData.light() : ThemeData.dark();
//         break;
//     }
//   }
// }
