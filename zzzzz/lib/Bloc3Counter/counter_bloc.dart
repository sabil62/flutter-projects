import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc(CounterState initialState) : super(initialState);

  CounterState get initialState => CounterState(counter: 5);

  @override
  Stream<CounterState> mapEventToState(
    CounterEvent event,
  ) async* {
    if (event is CounterIncrement) {
      yield CounterState(counter: state.counter + 1);
    } else if (event is CounterDecrement) {
      yield CounterState(counter: state.counter - 1);
    }
  }
}
