import '../model/food.dart';

enum Eventype { add, remove }

class FoodEvent {
  Food food;
  Eventype eventype;
  int index;
  FoodEvent.add(Food food) {
    this.eventype = Eventype.add;
    this.food = food;
  }
  FoodEvent.remove(int indexs) {
    this.eventype = Eventype.remove;
    this.index = indexs;
  }
}
