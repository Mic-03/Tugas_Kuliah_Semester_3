import 'dart:io';

void main() {

  const int hargaApel = 5000;
  const int hargaJeruk = 4000;

  stdout.write('Masukkan jumlah kilogram apel yang dibeli: ');
  int jumlahApel = int.parse(stdin.readLineSync()!);

  stdout.write('Masukkan jumlah kilogram jeruk yang dibeli: ');
  int jumlahJeruk = int.parse(stdin.readLineSync()!);

  int totalHarga = (jumlahApel * hargaApel) + (jumlahJeruk * hargaJeruk);

  print('Total harga yang harus dibayar: Rp $totalHarga');
}
