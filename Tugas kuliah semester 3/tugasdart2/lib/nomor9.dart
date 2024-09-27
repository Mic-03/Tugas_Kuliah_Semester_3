void main() {
  List<int> weights = [3, 2, 4, 5, 2];
  List<int> values = [50, 30, 40, 70, 20];
  int capacity = 10;

  int totalValue = 0;
  List<int> itemsTaken = [];
  int currentCapacity = 0;
  int i = 0;

  while (i < weights.length) {
    if (currentCapacity + weights[i] <= capacity) {
      currentCapacity += weights[i];
      totalValue += values[i];
      itemsTaken.add(i);
    }
    i++;
  }

  // Output total nilai dan barang yang dibawa
  print("Total nilai maksimal: $totalValue");
  print("Barang yang dibawa (index): $itemsTaken");
}
