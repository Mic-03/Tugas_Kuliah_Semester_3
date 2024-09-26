import 'dart:math';
import 'dart:io';

void main() {
  // Meminta input dari pengguna
  stdout.write('Masukkan angka: ');
  int? n = int.tryParse(stdin.readLineSync()!);

  if (n != null && n > 0) {
    // Membuat instance Random
    Random random = Random();

    // Membuat list untuk menyimpan angka acak
    List<int> randomNumbers = [];

    // Menghasilkan angka acak dan menambahkannya ke dalam list
    for (int i = 0; i < n; i++) {
      int randomNumber = random.nextInt(100); // Menghasilkan angka acak antara 0 hingga 99
      randomNumbers.add(randomNumber);
    }

    // Mencetak list angka acak
    print('Angka acak: $randomNumbers');
  } else {
    print('Input tidak valid. Silakan masukkan angka positif.');
  }
}
