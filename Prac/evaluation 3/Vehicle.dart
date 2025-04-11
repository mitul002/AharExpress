abstract class Vehicle {
  int speed;

  Vehicle(this.speed);

  void move();

  void displaySpeed() {
    print("Speed: $speed");
  }
}