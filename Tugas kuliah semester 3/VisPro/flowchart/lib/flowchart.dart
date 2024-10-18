// Fungsi untuk menghitung total jarak dari jalur yang diberikan
int calculatePathDistance(List<String> path, Map<String, Map<String, int>> graph) {
  int totalDistance = 0;
  
  for (int i = 0; i < path.length - 1; i++) {
    String from = path[i];
    String to = path[i + 1];
    totalDistance += graph[from]![to]!;
  }

  // Tambahkan jarak dari vertex terakhir kembali ke vertex awal
  totalDistance += graph[path.last]![path.first]!;
  return totalDistance;
}

// Fungsi untuk menghasilkan semua permutasi dari vertex
void generatePermutations(List<String> list, int l, int r, Map<String, Map<String, int>> graph, List<String> bestPath, List<int> bestDistance) {
  if (l == r) {
    // Cek jarak jalur saat ini
    int currentDistance = calculatePathDistance(list, graph);
    if (currentDistance < bestDistance[0]) {
      bestDistance[0] = currentDistance;
      bestPath.clear();
      bestPath.addAll(list);
    }
  } else {
    for (int i = l; i <= r; i++) {
      swap(list, l, i);
      generatePermutations(list, l + 1, r, graph, bestPath, bestDistance);
      swap(list, l, i); // Kembalikan urutan setelah swap
    }
  }
}

// Fungsi untuk menukar elemen di list
void swap(List<String> list, int i, int j) {
  String temp = list[i];
  list[i] = list[j];
  list[j] = temp;
}

void main() {
  // Matriks jarak antar vertex sesuai dengan graf yang diberikan
  Map<String, Map<String, int>> graph = {
    'A': {'B': 8, 'C': 3, 'D': 4, 'E': 10},
    'B': {'A': 8, 'C': 5, 'D': 2, 'E': 7},
    'C': {'A': 3, 'B': 5, 'D': 1, 'E': 6},
    'D': {'A': 4, 'B': 2, 'C': 1, 'E': 3},
    'E': {'A': 10, 'B': 7, 'C': 6, 'D': 3},
  };

  List<String> vertices = ['A', 'B', 'C', 'D', 'E'];

  List<String> bestPath = [];
  List<int> bestDistance = [double.maxFinite.toInt()]; // Jarak terbaik diinisialisasi dengan nilai besar

  // Menghasilkan semua permutasi dari vertex dan menemukan jalur terbaik
  generatePermutations(vertices, 0, vertices.length - 1, graph, bestPath, bestDistance);

  // Output jalur optimal dan jarak minimum
  print("Optimal TSP Path: ${bestPath.join(' -> ')} -> ${bestPath.first}");
  print("Minimum Distance: ${bestDistance[0]}");
}