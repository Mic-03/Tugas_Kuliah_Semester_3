import 'dart:io';

void main() {
  print('Masukkan konsumsi energi AC per jam (kWh):');
  double acPerHour = double.parse(stdin.readLineSync()!);

  print('Masukkan jumlah jam penggunaan AC per hari:');
  int acHours = int.parse(stdin.readLineSync()!);

  print('Masukkan konsumsi energi TV per jam (kWh):');
  double tvPerHour = double.parse(stdin.readLineSync()!);

  print('Masukkan jumlah jam penggunaan TV per hari:');
  int tvHours = int.parse(stdin.readLineSync()!);

  print('Masukkan konsumsi energi Lampu per jam (kWh):');
  double lampPerHour = double.parse(stdin.readLineSync()!);

  print('Masukkan jumlah jam penggunaan Lampu per hari:');
  int lampHours = int.parse(stdin.readLineSync()!);

  double acConsumption = acPerHour * acHours;
  double tvConsumption = tvPerHour * tvHours;
  double lampConsumption = lampPerHour * lampHours;

  double totalConsumption = acConsumption + tvConsumption + lampConsumption;

  print('Total konsumsi energi harian: $totalConsumption kWh');
}
