import 'package:flutter/material.dart';

void main() {
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
      home: MyHomePage(title: 'lion King'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _downter = 10;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementDounter() {
    setState(() {
      _downter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        title: Text('Lion King'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 100,
              width: 300,
              decoration: BoxDecoration(
                  color: Colors.teal[400],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [buildBoxShadow()]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'You have decremented by',
                    style: textStyleWhite(18),
                  ),
                  Text(
                    '$_downter',
                    style: textStyleWhite(24),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
          ),
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(
            height: 30,
          ),
          FloatingActionButton(
            onPressed: () => _decrementDounter(),
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  TextStyle textStyleWhite(double fontSizes) {
    return TextStyle(
        color: Colors.white, fontSize: fontSizes, fontWeight: FontWeight.bold);
  }

  BoxShadow buildBoxShadow() {
    return BoxShadow(
        color: Colors.black38, blurRadius: 18, offset: Offset(7, 7));
  }
}
