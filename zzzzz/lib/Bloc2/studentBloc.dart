import 'dart:async';
import './student.dart';

class StudentBloc {
  List<Student> students = [
    Student(1, 'aman', 2500),
    Student(2, 'san', 3500),
    Student(3, 'bman', 2500),
    Student(4, 'satan', 35000),
    Student(5, 'tan', 200),
    Student(6, 'lana', 3000),
  ];
  //streamcontrollers-------------------------------------------------------------------------------
  final _streamControllerStudentList = StreamController<List<Student>>();
  final _streamControllerIncrement = StreamController<Student>();
  final _streamControllerDecrement = StreamController<Student>();

  //streams for streambuilder--------------------------------------------------------------------
  //and sink to place data in stream
  Stream<List<Student>> get studentListStream => _streamControllerStudentList
      .stream; //this is used in streambuilder, data is passed below inside constructor

  //sink means changing/updating or adding new data
  StreamSink<List<Student>> get studentListSink =>
      _streamControllerStudentList.sink;
  StreamSink<Student> get increment => _streamControllerIncrement.sink;
  StreamSink<Student> get decrement => _streamControllerDecrement.sink;

  //constructor------------------------------------------------------------------
  StudentBloc() {
    _streamControllerStudentList.add(
        students); //you have to add list of streams in stream of studentlist

    _streamControllerIncrement.stream.listen(_increment);
    _streamControllerDecrement.stream.listen(_decrement);
  }
  _increment(Student studentey) {
    double fees = studentey.fees;
    double newfees = fees > 5000 ? fees + 100 : fees + 500;
    students[studentey.id - 1].fees = newfees;
    studentListSink.add(students);
  }

  _decrement(Student studenteys) {
    double fees = studenteys.fees;
    double newfees = fees < 500 ? fees - 1 : fees - 100;
    students[studenteys.id - 1].fees = newfees;
    studentListSink.add(students);
  }

  //dispose functions
  void dispose() {
    _streamControllerDecrement.close();
    _streamControllerIncrement.close();
    _streamControllerStudentList.close();
  }
}
