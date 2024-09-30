void main() {
  int productionPerHour = 20;
  int hoursPerDay = 8;

  int workDaysPerWeek = 5;

  int productionPerDay = productionPerHour * hoursPerDay;

  int productionPerWeek = productionPerDay * workDaysPerWeek;

  print('Jumlah barang yang dihasilkan dalam satu minggu: $productionPerWeek unit');
}
