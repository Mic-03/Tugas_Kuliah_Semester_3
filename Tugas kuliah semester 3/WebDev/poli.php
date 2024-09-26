<?php
function printPyramid(int $n): void {
    echo "<pre>"; // Gunakan <pre> agar format output piramida tetap terjaga di browser
    for ($i = 1; $i <= $n; $i++) {
        // Print leading spaces
        echo str_repeat("  ", $n - $i);

        // Print the left half of the palindrome
        for ($j = 1; $j <= $i; $j++) {
            echo "$j ";
        }

        // Print the right half of the palindrome
        for ($j = $i - 1; $j >= 1; $j--) {
            echo "$j ";
        }

        // Move to the next line
        echo PHP_EOL;
    }
    echo "</pre>";
}

// Cek jika form di-submit
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = (int)$_POST['number'];
    if ($input > 0) {
        printPyramid($input);
    } else {
        echo "<p>Masukkan angka yang lebih besar dari 0!</p>";
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Piramida Palindrome</title>
</head>
<body>
    <h1>Buat Piramida Angka Palindrome</h1>
    <form method="POST" action="">
        <label for="number">Masukkan angka:</label>
        <input type="number" name="number" id="number" required min="1">
        <button type="submit">Buat Piramida</button>
    </form>
</body>
</html>
