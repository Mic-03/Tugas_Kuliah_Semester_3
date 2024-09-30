import 'dart:io';

void main() {
  const int gaji = 4000000;
  const int bonus = 200000;

  stdout.write('Masukkan jumlah jam kerja: ');
  int jamkerja = int.parse(stdin.readLineSync()!);

  int totalgaji;
  if (jamkerja <= 40) {
    totalgaji = gaji;
  } else {
    totalgaji = gaji + bonus;
  }

  print('Total gaji: Rp $totalgaji');
}
