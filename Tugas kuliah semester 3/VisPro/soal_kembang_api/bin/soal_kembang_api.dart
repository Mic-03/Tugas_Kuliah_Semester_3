import 'dart:async';
import 'dart:io';
import 'dart:math';

void main() {
  // Menyembunyikan kursor
  stdout.write('\x1B[?25l');

  // Meminta input dari user untuk menentukan jumlah kembang api
  stdout.write('Berapa banyak kembang api: ');
  int fireworksCount = int.parse(stdin.readLineSync() ?? '1');

  // List warna berurutan untuk ledakan dan background
  List<String> colors = [
    '\x1B[31m', // Red
    '\x1B[33m', // Yellow
    '\x1B[32m', // Green
    '\x1B[36m', // Cyan
    '\x1B[35m', // Magenta
  ];

  // List background color sesuai dengan warna ledakan
  List<String> backgroundColors = [
    '\x1B[41m', // Red background
    '\x1B[43m', // Yellow background
    '\x1B[42m', // Green background
    '\x1B[46m', // Cyan background
    '\x1B[45m', // Magenta background
  ];

  final Random random = Random();
  int currentFireworkIndex = 0; // Index dari kembang api saat ini
  Particle? currentParticle;

  // Fungsi untuk memulai kembang api baru
  void startNewFirework() {
    bool startInCenter = (currentFireworkIndex == 0); // Kembang api pertama di tengah
    String fireworkColor = colors[currentFireworkIndex % colors.length];
    String backgroundColor = backgroundColors[currentFireworkIndex % backgroundColors.length];
    currentParticle = Particle(random, startInCenter, fireworkColor, backgroundColor);
  }

  startNewFirework();

  // Jalankan animasi dengan interval lebih lama untuk efek lebih lambat
  Timer.periodic(Duration(milliseconds: 150), (Timer timer) {
    _clearConsole();

    if (currentParticle != null) {
      _drawParticle(currentParticle!);
      currentParticle!.update();

      // Jika kembang api sudah selesai meledak
      if (currentParticle!.isReset) {
        currentFireworkIndex++;
        if (currentFireworkIndex < fireworksCount) {
          startNewFirework(); // Memulai kembang api berikutnya
        } else {
          timer.cancel();
          stdout.write('\x1B[?25h'); // Tampilkan kembali kursor setelah animasi selesai
          animateHBD(); // Memulai animasi HBD ANO
        }
      }
    }
  });
}

void _clearConsole() {
  // Escape code untuk membersihkan terminal
  print('\x1B[2J\x1B[0;0H');
}

void _drawParticle(Particle particle) {
  if (particle.isExploded) {
    // Mengubah latar belakang setelah ledakan sesuai dengan urutan warna
    fillScreenWithBackground(particle.backgroundColor, stdout.terminalColumns, stdout.terminalLines);
    drawStarExplosion(particle.x, particle.y, particle.explosionFrame, particle.color);
  } else {
    // Gambar partikel terbang tanpa mengubah latar belakang
    resetBackgroundColor();
    setCursorPosition(particle.y, particle.x);
    stdout.write('|');
  }
}

void drawStarExplosion(int x, int y, int frame, String color) {
  String reset = '\x1B[0m';

  // Menggambar animasi bintang persegi 8 dengan bertahap berdasarkan frame
  switch (frame) {
    case 1:
      setCursorPosition(y, x);
      stdout.write(color + '*' + reset); // Hanya karakter '*' yang berwarna
      break;
    case 2:
      drawStar(x, y, 1, color, reset);
      break;
    case 3:
      drawStar(x, y, 2, color, reset);
      break;
    case 4:
      drawStar(x, y, 3, color, reset);
      break;
    case 5:
      drawStar(x, y, 4, color, reset);
      break;
  }
}

void drawStar(int x, int y, int size, String color, String reset) {
  for (int i = -size; i <= size; i++) {
    for (int j = -size; j <= size; j++) {
      if (i == 0 && j == 0) continue;

      if (i == 0 || j == 0 || i.abs() == j.abs()) {
        setCursorPosition(y + i, x + j);
        stdout.write(color + '*' + reset); // Hanya karakter '*' yang berwarna
      }
    }
  }
}

void setCursorPosition(int row, int col) {
  // Menggunakan ASCII escape code untuk mengatur posisi kursor
  stdout.write('\x1B[${row};${col}H');
}

void resetBackgroundColor() {
  // Reset warna latar belakang terminal ke default
  stdout.write('\x1B[0m');
}

void fillScreenWithBackground(String bgColor, int width, int height) {
  // Mengubah latar belakang seluruh layar sesuai dengan warna ledakan
  stdout.write(bgColor);
  for (int y = 0; y < height; y++) {
    moveCursor(0, y);
    stdout.write(' ' * width); // Isi setiap baris dengan spasi untuk mengubah latar belakang
  }
  stdout.write('\x1B[0m'); // Reset terminal formatting setelah selesai
}

void moveCursor(int col, int row) {
  // Menggunakan ASCII escape code untuk mengatur posisi kursor
  stdout.write('\x1B[${row};${col}H');
}

// Fungsi untuk menampilkan animasi tulisan "HBD ANO" besar
void animateHBD() {
  List<String> hbdArt = [
    "H   H  BBBB   DDDD       A     N   N  OOO ",
    "H   H  B   B  D   D     A A    NN  N O   O",
    "HHHHH  BBBB   D   D    AAAAA   N N N O   O",
    "H   H  B   B  D   D   A     A  N  NN O   O",
    "H   H  BBBB   DDDD   A       A N   N  OOO ",
    "",
    "",
    "    **     GGGGG  BBBB   U  U",
    "    ||     G      B   B  U  U",
    "   |__|    G  GG  BBBB   U  U",
    "  |____|   G   G  B   B  U  U",
    " |______|  GGGGG  BBBB   UUUU",

  ];

  int terminalHeight = stdout.terminalLines;
  int terminalWidth = stdout.terminalColumns;
  int artHeight = hbdArt.length;
  int artWidth = hbdArt[0].length;

  int row = terminalHeight; // Mulai dari bawah layar

  Timer.periodic(Duration(milliseconds: 200), (Timer timer) {
    _clearConsole();
    
    // Cek jika sudah mencapai posisi atas, berhenti animasi
    if (row <= (terminalHeight - artHeight) ~/ 2) {
      timer.cancel();
      return;
    }

    // Hitung posisi x untuk menampilkan teks di tengah layar
    int startX = (terminalWidth - artWidth) ~/ 2;

    // Cetak HBD ANO pada posisi tertentu
    for (int i = 0; i < artHeight; i++) {
      setCursorPosition(row + i, startX);
      stdout.write('\x1B[33m' + hbdArt[i] + '\x1B[0m'); // Mengatur warna kuning untuk teks
    }

    row--; // Gerakkan teks ke atas tiap frame
  });
}

class Particle {
  int x;
  int y;
  double speedY;
  bool isExploded;
  bool isReset;
  int timeAlive;
  int lifespan;
  int explosionDuration;
  int explosionFrame;
  String color; // Warna partikel
  String backgroundColor; // Warna latar belakang saat meledak

  Particle(Random random, bool startInCenter, this.color, this.backgroundColor)
      : x = startInCenter ? (stdout.terminalColumns ~/ 2) : random.nextInt(stdout.terminalColumns),
        y = stdout.terminalLines - 1,
        speedY = -1, // Ubah kecepatan menjadi -1 agar lebih pasti dan konsisten
        isExploded = false,
        isReset = false,
        timeAlive = 0,
        lifespan = random.nextInt(stdout.terminalLines ~/ 2) + (stdout.terminalLines ~/ 4), // Meledak secara acak sebelum atau setelah tengah
        explosionDuration = 5,
        explosionFrame = 0;

  void update() {
    if (!isExploded) {
      y += speedY.toInt();
      timeAlive++;

      // Jika partikel telah mencapai waktu hidup (lifespan) yang ditentukan
      if (timeAlive >= lifespan) {
        isExploded = true;
        explosionFrame = 1;
      }
    } else {
      // Mengatur tahap ledakan
      if (explosionFrame <= explosionDuration) {
        explosionFrame++;
      } else {
        isReset = true;
        resetBackgroundColor(); // Reset warna setelah ledakan selesai
      }
    }
  }

  void reset(Random random) {
    y = stdout.terminalLines - 1; // Kembali ke posisi awal (bawah layar)
    x = random.nextInt(stdout.terminalColumns); // Posisi X acak untuk partikel berikutnya
    speedY = -1; // Kecepatan tetap negatif untuk bergerak ke atas
    isExploded = false;
    isReset = false;
    timeAlive = 0;
    lifespan = random.nextInt(stdout.terminalLines ~/ 2) + (stdout.terminalLines ~/ 4); // Meledak secara acak sebelum atau setelah tengah
    explosionDuration = 5; // Reset durasi ledakan
    explosionFrame = 0;
  }
}