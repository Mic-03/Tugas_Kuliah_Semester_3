// Base class Animal
class Animal {
  // Private attribute for animal name
  String _name;

  // Constructor
  Animal(this._name);

  // Getter for name
  String get name => _name;

  // Setter for name
  set name(String newName) {
    if (newName.isNotEmpty) {
      _name = newName;
    } else {
      print('Name cannot be empty.');
    }
  }

  // Method to make a sound (to be overridden by subclasses)
  void sound() {
    print('Some generic animal sound.');
  }

  // Method to eat
  void eat() {
    print('The animal is eating.');
  }
}