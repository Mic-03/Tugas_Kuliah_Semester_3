import 'dart:math';
import 'dart:io';

void main() {
  // Meminta input dari pengguna
  stdout.write('Masukkan angka: ');
  int? n = int.tryParse(stdin.readLineSync()!);

  Random random = Random();
  List<int> randomNumbers = [];

  // Menggunakan fungsi seperti if
  tes1(n != null && n > 0, () {
    int i = 0;
    // Menggunakan fungsi seperti while untuk menghasilkan angka acak
    tes2(() => i < n!, () {
      int randomNumber = random.nextInt(100); // Menghasilkan angka acak antara 0 hingga 99
      randomNumbers.add(randomNumber);
      i++;
    });

    // Cetak list angka
    print('Angka acak: $randomNumbers');

    print('Pilih operasi yang ingin dilakukan:');
    print('1. Bubble Sort');
    print('2. Inversi');
    print('3. Shuffle');
    print('4. Piramida berurut');
    print('5. Piramida');

    stdout.write('Masukkan pilihan (1/2/3/4/5): ');
    int? pilihan = int.tryParse(stdin.readLineSync()!);

    // Menggunakan fungsi seperti if untuk memeriksa validitas input pilihan
    tes1(pilihan != null, () {
      DateTime start = DateTime.now(); // Mulai waktu eksekusi

      // Menggunakan fungsi seperti while untuk menggantikan perulangan if
      int i = 0;
      tes2(() => i == 0, () {
        switch (pilihan) {
          case 1:
            List<int> sortedList = bubbleSort(randomNumbers);
            print('Hasil Bubble Sort: $sortedList');
            i++;
            break;
          case 2:
            int inversions = hitungInversi(randomNumbers);
            print('Jumlah inversi: $inversions');
            List<int> reversedList = randomNumbers.reversed.toList();
            print('Array setelah dibalik: $reversedList');
            i++;
            break;
          case 3:
            randomNumbers.shuffle();
            print('Hasil Shuffle (acak posisi elemen): $randomNumbers');
            i++;
            break;
          case 4:
            printPiramida(randomNumbers);
            i++;
            break;
          case 5:
            piramidaDalamArray(randomNumbers);
            i++;
            break;
          default:
            print('Pilihan tidak valid.');
            i++;
            break;
        }
      });

      DateTime end = DateTime.now(); // Akhir waktu eksekusi
      Duration executionTime = end.difference(start);
      print('Waktu eksekusi: ${executionTime.inMilliseconds} ms');
    }, () {
      print('Input pilihan tidak valid.');
    });
  }, () {
    print('Input tidak valid. Silakan masukkan angka positif.');
  });
}

// Fungsi Bubble Sort
List<int> bubbleSort(List<int> list) {
  List<int> arr = List.from(list);
  int n = arr.length;
  int i = 0;

  tes2(() => i < n - 1, () {
    int j = 0;
    tes2(() => j < n - i - 1, () {
      tes1(arr[j] > arr[j + 1], () {
        int temp = arr[j];
        arr[j] = arr[j + 1];
        arr[j + 1] = temp;
      }, () {});
      j++;
    });
    i++;
  });

  return arr;
}

// Fungsi untuk menghitung jumlah inversi
int hitungInversi(List<int> list) {
  int inversions = 0;
  int i = 0;

  tes2(() => i < list.length - 1, () {
    int j = i + 1;
    tes2(() => j < list.length, () {
      tes1(list[i] > list[j], () {
        inversions++;
      }, () {});
      j++;
    });
    i++;
  });

  return inversions;
}

// Fungsi untuk mencetak piramida
void printPiramida(List<int> list) {
  int n = list.length;
  int i = 0;

  tes2(() => i < n, () {
    int j = 0;
    tes2(() => j < n - i - 1, () {
      stdout.write(' ');
      j++;
    });

    int k = 0;
    tes2(() => k <= i, () {
      stdout.write('${list[k]} ');
      k++;
    });
    print('');
    i++;
  });
}

// Fungsi untuk mencetak piramida dari elemen array tanpa mengulang angka
void piramidaDalamArray(List<int> list) {
  int index = 0;
  int n = list.length;
  int level = 1;

  // Terus membangun piramida sampai semua elemen array digunakan
  tes2(() => index < n, () {
    int j = 0;
    tes2(() => j < n - level && index + level <= n, () {
      stdout.write(' ');
      j++;
    });

    int k = 0;
    // Cetak elemen sebanyak mungkin sesuai level
    tes2(() => k < level && index < n, () {
      stdout.write('${list[index]} ');
      index++;
      k++;
    });
    print('');
    level++;
  });
}

void tes1(bool condition, Function onTrue, Function onFalse) {
  if (condition) {
    onTrue();
  } else {
    onFalse();
  }
}

void tes2(bool Function() condition, Function body) {
  while (condition()) {
    body();
  }
}
