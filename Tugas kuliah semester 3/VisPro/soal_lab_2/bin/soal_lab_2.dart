import 'package:soal_lab_2/nomor_1.dart';
import 'package:soal_lab_2/nomor_2.dart';
import 'package:soal_lab_2/nomor_3.dart';
import 'package:soal_lab_2/nomor_4.dart';
import 'package:soal_lab_2/nomor_5.dart';
import 'package:soal_lab_2/nomor_6.dart';
import 'package:soal_lab_2/nomor_7.dart';
import 'dart:io';

void nomor_1() {
  // Taking user input for student details
  stdout.write('Enter student name: ');
  String name = stdin.readLineSync() ?? '';

  stdout.write('Enter student ID: ');
  int studentID = int.parse(stdin.readLineSync() ?? '0');

  stdout.write('Enter student grade: ');
  double grade = double.parse(stdin.readLineSync() ?? '0.0');

  // Creating a Student object using user input
  Student student = Student(name, studentID, grade);

  // Displaying student information
  student.displayInfo();

  // Checking if the student passes
  if (student.isPassing()) {
    print('The student passes.');
  } else {
    print('The student does not pass.');
  }
}

void nomor_2() {
  stdout.write('Enter initial balance for BankAccount: ');
  double initialBalance = double.parse(stdin.readLineSync() ?? '0.0');

  BankAccount account = BankAccount(initialBalance);

  while (true) {
    print('\nBankAccount Menu:');
    print('1. Deposit');
    print('2. Withdraw');
    print('3. Check Balance');
    print('4. Create Savings Account');
    print('5. Exit');
    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter amount to deposit: ');
        double depositAmount = double.parse(stdin.readLineSync() ?? '0.0');
        account.deposit(depositAmount);
        break;
      case '2':
        stdout.write('Enter amount to withdraw: ');
        double withdrawAmount = double.parse(stdin.readLineSync() ?? '0.0');
        account.withdraw(withdrawAmount);
        break;
      case '3':
        account.checkBalance();
        break;
      case '4':
        stdout.write('Enter initial balance for SavingsAccount: ');
        double savingsBalance = double.parse(stdin.readLineSync() ?? '0.0');
        SavingsAccount savings = SavingsAccount(savingsBalance);

        while (true) {
          print('\nSavingsAccount Menu:');
          print('1. Deposit');
          print('2. Withdraw');
          print('3. Check Balance');
          print('4. Apply Interest');
          print('5. Go Back to Main Menu');
          stdout.write('Choose an option: ');
          String? savingsChoice = stdin.readLineSync();

          switch (savingsChoice) {
            case '1':
              stdout.write('Enter amount to deposit: ');
              double depositAmount = double.parse(stdin.readLineSync() ?? '0.0');
              savings.deposit(depositAmount);
              break;
            case '2':
              stdout.write('Enter amount to withdraw: ');
              double withdrawAmount = double.parse(stdin.readLineSync() ?? '0.0');
              savings.withdraw(withdrawAmount);
              break;
            case '3':
              savings.checkBalance();
              break;
            case '4':
              stdout.write('Enter interest rate (%): ');
              double interestRate = double.parse(stdin.readLineSync() ?? '0.0');
              savings.applyInterest(interestRate);
              break;
            case '5':
              print('Returning to Main Menu...');
              break;
            default:
              print('Invalid option. Please try again.');
          }
          if (savingsChoice == '5') break;
        }
        break;
      case '5':
        print('Exiting... Goodbye!');
        return;
      default:
        print('Invalid option. Please try again.');
    }
  }
}

void nomor_3() {
  ATM atm = ATM();

  while (true) {
    print('\nATM Menu:');
    print('1. Deposit Money');
    print('2. Withdraw Money');
    print('3. Check Balance');
    print('4. Exit');
    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter amount to deposit: ');
        double depositAmount = double.parse(stdin.readLineSync() ?? '0.0');
        atm.deposit(depositAmount);
        break;
      case '2':
        stdout.write('Enter amount to withdraw: ');
        double withdrawAmount = double.parse(stdin.readLineSync() ?? '0.0');
        atm.withdraw(withdrawAmount);
        break;
      case '3':
        atm.checkBalance();
        break;
      case '4':
        print('Thank you for using the ATM. Goodbye!');
        return;
      default:
        print('Invalid option. Please try again.');
    }
  }
}

void nomor_4() {
  Library library = Library();

  while (true) {
    print('\nLibrary Menu:');
    print('1. Add Book');
    print('2. Remove Book');
    print('3. Display Books');
    print('4. Exit');
    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        // Adding a book
        stdout.write('Enter book title: ');
        String title = stdin.readLineSync() ?? '';

        stdout.write('Enter book author: ');
        String author = stdin.readLineSync() ?? '';

        stdout.write('Enter year of publication: ');
        int year = int.parse(stdin.readLineSync() ?? '0');

        Book book = Book(title, author, year);
        library.addBook(book);
        break;

      case '2':
        // Removing a book
        stdout.write('Enter title of the book to remove: ');
        String title = stdin.readLineSync() ?? '';
        library.removeBook(title);
        break;

      case '3':
        // Displaying all books
        library.displayBooks();
        break;

      case '4':
        // Exiting the program
        print('Exiting the Library System. Goodbye!');
        return;

      default:
        print('Invalid option. Please try again.');
    }
  }
}

void nomor_5() {
  // Create a Dog object and call its methods
  Dog dog = Dog();
  print('Dog:');
  dog.sound();
  dog.eat();

  // Create a Cat object and call its methods
  Cat cat = Cat();
  print('\nCat:');
  cat.sound();
  cat.eat();

  // Demonstrating polymorphism
  Animal animalDog = Dog();
  Animal animalCat = Cat();

  print('\nUsing polymorphism:');
  animalDog.sound(); // Calls Dog's sound method
  animalCat.sound(); // Calls Cat's sound method
}

void nomor_6() {
  stdout.write('Enter the temperature in Celsius: ');
  double celsius = double.parse(stdin.readLineSync() ?? '0.0');

  print('\nChoose the conversion you want:');
  print('1. Reaumur');
  print('2. Fahrenheit');
  print('3. Kelvin');
  stdout.write('Enter your choice (1, 2, or 3): ');
  String? choice = stdin.readLineSync();

  switch (choice) {
    case '1':
      double reaumur = celsiusToReaumur(celsius);
      print('Temperature in Reaumur: ${reaumur.toStringAsFixed(2)}°Re');
      break;
    case '2':
      double fahrenheit = celsiusToFahrenheit(celsius);
      print('Temperature in Fahrenheit: ${fahrenheit.toStringAsFixed(2)}°F');
      break;
    case '3':
      double kelvin = celsiusToKelvin(celsius);
      print('Temperature in Kelvin: ${kelvin.toStringAsFixed(2)} K');
      break;
    default:
      print('Invalid choice. Please run the program again and choose 1, 2, or 3.');
  }
}

void nomor_7() {
  // Ask the user to choose between Car or Bike
  print("Do you want to create a Car or a Bike? (Enter 'car' or 'bike')");
  String? choice = stdin.readLineSync()?.toLowerCase();

  if (choice == 'car' || choice == 'bike') {
    // Ask for the speed only
    print("Enter the speed of the $choice:");
    int? speed = int.parse(stdin.readLineSync()!);

    // Create the appropriate instance based on user input
    Vehicle? vehicle;
    if (choice == 'car') {
      vehicle = Car(speed);
    } else if (choice == 'bike') {
      vehicle = Bike(speed);
    }

    // Call the move method for the created vehicle
    vehicle?.move();
  } else {
    print("Invalid input. Please enter 'car' or 'bike'.");
  }
}



void main() {
  print('1. Cara kerja nomor 1');
  print('2. Cara kerja nomor 2');
  print('3. Cara kerja nomor 3');
  print('4. Cara kerja nomor 4');
  print('5. Cara kerja nomor 5');
  print('6. Cara kerja nomor 6');
  print('7. Cara kerja nomor 7');

  stdout.write('Masukkan pilihan (1/2/3/4/5/6/7): ');
  int? pilihan = int.tryParse(stdin.readLineSync()!);

  if (pilihan != null) {
    switch (pilihan) {
      case 1:
        nomor_1();
        exit(0);
      case 2:
        nomor_2();
        break;
      case 3:
        nomor_3();
        break;
      case 4:
        nomor_4();
        break;
      case 5:
        nomor_5();
        break;
      case 6:
        nomor_6();
        break;
      case 7:
        nomor_7();
        break;
    }
  } else {
    print('Input pilihan tidak valid.');
  }
}
