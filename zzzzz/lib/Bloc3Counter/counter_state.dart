part of 'counter_bloc.dart';

class CounterState extends Equatable {
  int counter;
  CounterState({this.counter});
  //for equatable
  List<Object> get props => [counter];
}
