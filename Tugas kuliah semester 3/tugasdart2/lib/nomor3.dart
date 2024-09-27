import 'dart:io';

void main() {
  const double pi = 3.14;

  stdout.write('Masukkan diameter lingkaran: ');
  double diameter = double.parse(stdin.readLineSync()!);

  double radius = diameter / 2;

  double luasLingkaran = pi * radius * radius;

  print('Luas lingkaran dengan diameter $diameter adalah: $luasLingkaran');
}
