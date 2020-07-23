import 'package:flutter/material.dart';
import 'Bloc/EmployeeBloc.dart';
import 'Bloc/employee.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EmployeeBloc _employeeBloc;
  @override
  void dispose() {
    super.dispose();
    //to dispose stream controllers //vvi
    _employeeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Stream Bloc Pattern'),
        ),
        body: Column(
          children: [
            StreamBuilder<List<Employee>>(
              stream: _employeeBloc.employeeListStream,
              initialData: null,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Employee>> snapshot) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              snapshot.data[index].id.toString(),
                              style:
                                  TextStyle(fontSize: 18, color: Colors.black),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  snapshot.data[index].name,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                ),
                                Text('\$ ${snapshot.data[index].salary}'),
                              ],
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.thumb_up,
                                  color: Colors.green,
                                  size: 36,
                                ),
                                onPressed: () {
                                  _employeeBloc.increment
                                      .add(snapshot.data[index]);
                                }),
                            IconButton(
                                icon: Icon(
                                  Icons.thumb_down,
                                  color: Colors.red,
                                  size: 36,
                                ),
                                onPressed: () {
                                  _employeeBloc.decrement
                                      .add(snapshot.data[index]);
                                })
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ));
  }
}
