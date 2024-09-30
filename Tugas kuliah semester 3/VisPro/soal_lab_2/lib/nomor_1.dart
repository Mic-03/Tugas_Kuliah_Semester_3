class Student {

  String name;
  int studentID;
  double grade;

  Student(this.name, this.studentID, this.grade);

  void displayInfo() {
    print('Name: $name');
    print('Student ID: $studentID');
    print('Grade: $grade');
  }

  bool isPassing() {
    return grade >= 70;
  }
}