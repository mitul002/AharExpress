import 'person.dart';

class Student extends Person {
  int roll_number = 1;
  int marks = 45;
  @override
  void display_info() {
    super.display_info();
    print("Roll number: $roll_number");
    print("Marks out of 100: $marks");
  }
}
