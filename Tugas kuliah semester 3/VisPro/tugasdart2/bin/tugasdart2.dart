import 'package:tugasdart2/nomor1.dart' as nomor1;
import 'package:tugasdart2/nomor2.dart' as nomor2;
import 'package:tugasdart2/nomor3.dart' as nomor3;
import 'package:tugasdart2/nomor4.dart' as nomor4;
import 'package:tugasdart2/nomor5.dart' as nomor5;
import 'package:tugasdart2/nomor6.dart' as nomor6;
import 'package:tugasdart2/nomor7.dart' as nomor7;
import 'package:tugasdart2/nomor8.dart' as nomor8;
import 'package:tugasdart2/nomor9.dart' as nomor9;
import 'package:tugasdart2/nomor10.dart' as nomor10;
import 'package:tugasdart2/nomor11.dart' as nomor11;
import 'package:tugasdart2/nomor12.dart' as nomor12;
import 'dart:io';

void main() {
  print('1. Cara kerja nomor 1');
  print('2. Cara kerja nomor 2');
  print('3. Cara kerja nomor 3');
  print('4. Cara kerja nomor 4');
  print('5. Cara kerja nomor 5');
  print('6. Cara kerja nomor 6');
  print('7. Cara kerja nomor 7');
  print('8. Cara kerja nomor 8');
  print('9. Cara kerja nomor 9');
  print('10. Cara kerja nomor 10');
  print('11. Cara kerja nomor 11');
  print('12. Cara kerja nomor 12');
  print('13. Cara kerja nomor 13');
  print('14. Cara kerja nomor 14');
  print('15. Cara kerja nomor 15');

  stdout.write('Masukkan pilihan (1/2/3/4/5/6/7/8/9/10/11/12/13/14/15): ');
  int? pilihan = int.tryParse(stdin.readLineSync()!);

  if (pilihan != null) {
    switch (pilihan) {
      case 1:
        nomor1.main(); // Menjalankan program dari tugas nomor 1
        exit(0); // Menghentikan program setelah nomor1 selesai
      case 2:
        nomor2.main();
        break;
      case 3:
        nomor3.main();
        break;
      case 4:
        nomor4.main();
        break;
      case 5:
        nomor5.main();
        break;
      case 6:
        nomor6.main();
        break;
      case 7:
        nomor7.main();
        break;
      case 8:
        nomor8.main();
        break;
      case 9:
        nomor9.main();
        break;
      case 10:
        nomor10.main();
        break;
      case 11:
        nomor11.main();
        break;
      case 12:
        nomor12.main();
        break;
      case 13:
        print('Cara kerja nomor 13 sedang dalam tahap pengembangan.');
        break;
      case 14:
        print('Cara kerja nomor 14 sedang dalam tahap pengembangan.');
        break;
      case 15:
        print('Cara kerja nomor 15 sedang dalam tahap pengembangan.');
        break;
      default:
        print('Pilihan tidak valid.');
        break;
    }
  } else {
    print('Input pilihan tidak valid.');
  }
}
