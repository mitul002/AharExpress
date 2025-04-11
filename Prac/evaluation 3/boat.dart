import 'vehicle.dart';

class Boat extends Vehicle {
  Boat(super.speed);

  @override
  void move() {
    print("Boat is sailing.");
  }
}
