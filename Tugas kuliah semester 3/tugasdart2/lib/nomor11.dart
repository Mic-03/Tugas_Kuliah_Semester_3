void main() {
  int chattingConsumption = 1;
  int videoConsumption = 2;
  int gameConsumption = 3;

  int chattingTime = 60;
  int videoTime = 30;
  int gameTime = 45;

  int initialBattery = 100;

  int chattingUsed = (chattingTime / 5 * chattingConsumption).toInt();
  int videoUsed = (videoTime / 5 * videoConsumption).toInt();
  int gameUsed = (gameTime / 5 * gameConsumption).toInt();

  int totalUsed = chattingUsed + videoUsed + gameUsed;

  int remainingBattery = initialBattery - totalUsed;

  print('Sisa baterai: $remainingBattery%');
}
