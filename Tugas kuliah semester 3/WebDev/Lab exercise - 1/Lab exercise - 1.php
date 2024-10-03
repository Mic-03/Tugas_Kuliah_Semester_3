<?php
function merge(array &$nums1, int $m, array $nums2, int $n): void {
    $p1 = $m - 1; // Pointer untuk nums1
    $p2 = $n - 1; // Pointer untuk nums2
    $p = $m + $n - 1; // Pointer untuk posisi terakhir di nums1

    // Menggabungkan dari belakang untuk menghindari pergeseran elemen
    while ($p1 >= 0 && $p2 >= 0) {
        if ($nums1[$p1] > $nums2[$p2]) {
            $nums1[$p] = $nums1[$p1];
            $p1--;
        } else {
            $nums1[$p] = $nums2[$p2];
            $p2--;
        }
        $p--;
    }

    // Jika masih ada elemen di nums2, salin elemen tersebut
    while ($p2 >= 0) {
        $nums1[$p] = $nums2[$p2];
        $p--;
        $p2--;
    }
}

// Mendapatkan input dari user (gunakan POST method atau CLI)
function getInputArray(string $prompt): array {
    $input = readline($prompt);
    return array_map('intval', explode(',', $input)); // Memisahkan input dengan koma dan mengubahnya menjadi array integer
}

$cli_mode = PHP_SAPI === 'cli';  // Untuk mendeteksi apakah dijalankan di CLI atau Web

if ($cli_mode) {
    // Input dari user via CLI
    $nums1 = getInputArray("Masukkan elemen nums1 (dipisahkan dengan koma, termasuk 0 untuk tempat kosong): ");
    $m = intval(readline("Masukkan nilai m (jumlah elemen non-zero di nums1): "));
    $nums2 = getInputArray("Masukkan elemen nums2 (dipisahkan dengan koma): ");
    $n = intval(readline("Masukkan nilai n (jumlah elemen di nums2): "));
    
    // Panggil fungsi merge
    merge($nums1, $m, $nums2, $n);

    // Menampilkan hasil akhir di CLI
    echo "Hasil penggabungan: " . implode(',', $nums1) . "\n";
} else {
    // Input dari user via Web (POST request)
    if ($_SERVER["REQUEST_METHOD"] === "POST") {
        // Mengambil input dari form
        $nums1 = array_map('intval', explode(',', $_POST['nums1']));
        $m = intval($_POST['m']);
        $nums2 = array_map('intval', explode(',', $_POST['nums2']));
        $n = intval($_POST['n']);

        // Debugging - untuk memastikan input diterima dengan benar
        echo "nums1 (sebelum merge): ";
        print_r($nums1);
        echo "<br>nums2: ";
        print_r($nums2);
        echo "<br>m: $m, n: $n <br>";

        // Panggil fungsi merge
        merge($nums1, $m, $nums2, $n);

        // Menampilkan hasil akhir di web
        echo "<h2>Hasil penggabungan:</h2>";
        echo "<p>" . implode(',', $nums1) . "</p>";
    } else {
        // Jika belum ada POST request, tampilkan form sederhana
        echo '<form method="POST">
                <label>Array nums1 (pisahkan dengan koma, termasuk 0 untuk tempat kosong):</label><br>
                <input type="text" name="nums1" required><br><br>
                
                <label>Jumlah elemen non-zero di nums1 (m):</label><br>
                <input type="number" name="m" required><br><br>
                
                <label>Array nums2 (pisahkan dengan koma):</label><br>
                <input type="text" name="nums2" required><br><br>
                
                <label>Jumlah elemen di nums2 (n):</label><br>
                <input type="number" name="n" required><br><br>
                
                <input type="submit" value="Merge Arrays">
              </form>';
    }
}
?>
