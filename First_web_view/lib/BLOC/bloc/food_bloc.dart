import '../model/food.dart';
import '../events/foodevent.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class FoodBloc extends Bloc<FoodEvent, List<Food>> {
  FoodBloc(List<Food> initialState) : super(initialState);

  @override
  Stream<List<Food>> mapEventToState(FoodEvent event) async* {
    switch (event.eventype) {
      case Eventype.add:
        List<Food> newstate = List.from(state);
        if (event.food != null) {
          newstate.add(event.food);
        }
        yield newstate;
        break;
      case Eventype.remove:
        List<Food> newstate = List.from(state);
        newstate.removeAt(event.index);
        yield newstate;
        break;
      default:
        print('not necessary $event');
    }

    throw UnimplementedError();
  }
}
