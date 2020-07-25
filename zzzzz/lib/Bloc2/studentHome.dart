import 'package:flutter/material.dart';
import './student.dart';
import './studentBloc.dart';

class HomeStudent extends StatefulWidget {
  @override
  _HomeStudentState createState() => _HomeStudentState();
}

class _HomeStudentState extends State<HomeStudent> {
  StudentBloc studentBloc = new StudentBloc();
  @override
  void dispose() {
    super.dispose();
    studentBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Text('This is student from bloc', style: buildTextStyle(32)),
          SizedBox(
            height: 30,
          ),
          StreamBuilder<List<Student>>(
            stream: studentBloc.studentListStream,
            builder: (context, snapshot) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (context, index) => Card(
                  elevation: 5,
                  shadowColor: Colors.black26,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          '${snapshot.data[index].id}',
                          style: buildTextStyle(34),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              snapshot.data[index].name,
                              style: buildTextStyle(26),
                            ),
                            Text(
                              '\$ ${snapshot.data[index].fees}',
                              style: buildTextStyle(16),
                            )
                          ],
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.thumb_up,
                              color: Colors.green,
                            ),
                            onPressed: () {
                              studentBloc.increment.add(snapshot.data[index]);
                            }),
                        IconButton(
                          icon: Icon(
                            Icons.thumb_down,
                            color: Colors.red,
                          ),
                          onPressed: () =>
                              studentBloc.decrement.add(snapshot.data[index]),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }

  TextStyle buildTextStyle(double textSize) {
    return TextStyle(
        fontSize: textSize,
        color: Colors.grey[800],
        fontWeight: FontWeight.bold);
  }
}
