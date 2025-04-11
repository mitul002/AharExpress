import 'dart:io';

void main()
{
  var name = stdin.readLineSync();
  double num1 = double.parse(name!);
  var name2 = stdin.readLineSync();
  double num2 = double.parse(name2!);
  double plus = num1 + num2;
  print("$plus");
}