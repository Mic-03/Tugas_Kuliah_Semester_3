import 'dart:io';

void main() {

  stdout.write('Masukkan suhu dalam Celsius: ');
  double celsius = double.parse(stdin.readLineSync()!);

  double fahrenheit = (9 / 5) * celsius + 32;

  print('Suhu dalam Fahrenheit: $fahrenheit');
}
