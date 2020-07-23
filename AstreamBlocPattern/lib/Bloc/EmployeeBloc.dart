// imports

// List of Employee(class objects)
// Stream contollers

// Stream sink getter

// Constructor - add data; Listen to changes

// Core functions

// dispose
import 'dart:async';
import './employee.dart';

class EmployeeBloc {
  List<Employee> employees = [
    Employee(1, 'Aman', 10000),
    Employee(2, 'bman', 20000),
    Employee(3, 'cman', 30000),
    Employee(4, 'daman', 40000),
    Employee(5, 'eaman', 50000),
  ];
  final _streamControllerEmployeeList = StreamController<List<Employee>>();
  final _streamControllerIncrement = StreamController<Employee>();
  final _streamControllerDecrement = StreamController<Employee>();

//these are actually listed as streams in streambuilder
  Stream<List<Employee>> get employeeListStream =>
      _streamControllerEmployeeList.stream;
  StreamSink<List<Employee>> get employeeListSink =>
      _streamControllerEmployeeList.sink;

  StreamSink<Employee> get increment => _streamControllerIncrement.sink;

  StreamSink<Employee> get decrement => _streamControllerDecrement.sink;

  //constructor
  EmployeeBloc() {
    _streamControllerEmployeeList.add(employees);

    _streamControllerIncrement.stream.listen(_incrementSalaray);

    _streamControllerDecrement.stream.listen(_decrementSalary);
  }
  //functios to add
  _incrementSalaray(Employee employee) {
    double salaries = employee.salary;
    double newSalary = salaries + 0.2 * salaries;

    employees[employee.id].salary = newSalary;

    //to update data
    employeeListSink.add(employees);
  }

  _decrementSalary(Employee employee) {
    double salary = employee.salary;
    double newSalary = salary - 0.2 * salary;

    employees[employee.id].salary = newSalary;

    //update
    employeeListSink.add(employees);
  }

  void dispose() {
    _streamControllerEmployeeList.close();
    _streamControllerDecrement.close();
    _streamControllerIncrement.close();
  }
}
