import 'vehicle.dart';

class Car extends Vehicle {
  Car(super.speed);

  @override
  void move() {
    print("Car is driving.");
  }
}
