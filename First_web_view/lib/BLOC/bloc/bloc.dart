import '../model/food.dart';
import '../events/foodevent.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Food_bloc extends Bloc<FoodEvent, dynamic> {
  Food_bloc(initialState) : super(initialState);

  @override
  Stream mapEventToState(FoodEvent event) async* {
    switch (event.eventype) {
      case Eventype.add:
        var newstate;
        newstate = List.from(state);
        yield newstate;
        break;
      case Eventype.remove:
        break;
      default:
    }
    throw UnimplementedError();
  }
}
