import 'dart:io';

void main() {
  const int hargaparkir1 = 2000;
  const int hargaparkir2 = 1000;

  stdout.write('Masukkan jam masuk: ');
  int jammasuk = int.parse(stdin.readLineSync()!);

  int totalbiaya;
  if (jammasuk <= 2) {
    totalbiaya = jammasuk * hargaparkir1;
  } else {
    totalbiaya = (jammasuk * hargaparkir2) + (jammasuk - 2) * hargaparkir1;
  }
  print('biaya parkir: $totalbiaya');
}
