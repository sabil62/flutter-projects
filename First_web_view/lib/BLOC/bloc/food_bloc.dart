import '../model/food.dart';
import '../events/foodevent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Food_bloc extends Bloc<FoodEvent, List<Food>> {
  Food_bloc(initialState) : super(initialState);

  @override
  Stream<List<Food>> mapEventToState(FoodEvent event) async* {
    switch (event.eventype) {
      case Eventype.add:
        List newstate;
        newstate = List.from(state);
        if (event.food != null) {
          newstate.add(event.food);
        }
        yield newstate;
        break;
      case Eventype.remove:
        List newstate;
        newstate = List.from(state);
        newstate.removeAt(event.index);
        yield newstate;

        break;
      default:
        print('error in $event');
    }
    throw UnimplementedError();
  }
}
