part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();
}

class CounterIncrement extends CounterEvent {
  List<Object> get props => [];
}

class CounterDecrement extends CounterEvent {
  List<Object> get props => [];
}
