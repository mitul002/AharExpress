import 'Car.dart';
import 'boat.dart';
void main() {
  Car myCar = Car(60);
  Boat myBoat = Boat(15);

  myCar.move();
  myCar.displaySpeed();

  myBoat.move();
  myBoat.displaySpeed();
}