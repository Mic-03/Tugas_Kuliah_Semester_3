class Vehicle {
  String name;
  int speed;

  Vehicle(this.name, this.speed);

  // Method to classify speed
  String classifySpeed() {
    if (speed < 30) {
      return "slow";
    } else if (speed <= 60) {
      return "normal";
    } else {
      return "fast";
    }
  }

  // This method will be overridden by subclasses
  void move() {
    print("The vehicle is moving.");
  }
}

// Subclass Car that inherits from Vehicle
class Car extends Vehicle {
  Car(int speed) : super("Car", speed);

  // Override the move method
  @override
  void move() {
    String speedCategory = classifySpeed();
    print("The car moves $speedCategory on roads.");
  }
}

// Subclass Bike that inherits from Vehicle
class Bike extends Vehicle {
  Bike(int speed) : super("Bike", speed);

  // Override the move method
  @override
  void move() {
    String speedCategory = classifySpeed();
    print("The bike moves $speedCategory through traffic.");
  }
}