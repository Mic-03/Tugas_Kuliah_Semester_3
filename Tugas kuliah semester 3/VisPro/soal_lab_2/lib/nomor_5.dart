class Animal {
  void sound() {
    print('Some generic animal sound.');
  }

  // Method to eat
  void eat() {
    print('The animal is eating.');
  }
}

class Dog extends Animal {
  @override
  void sound() {
    print('The dog barks: Woof! Woof!');
  }
  @override
  void eat() {
    print('The dog is eating bones.');
  }
}

class Cat extends Animal {
  @override
  void sound() {
    print('The cat meows: Meow! Meow!');
  }
  @override
  void eat() {
    print('The cat is eating fish.');
  }
}

