class Book {

  String title;
  String author;
  int year;

  Book(this.title, this.author, this.year);

  void display() {
    print('Title: $title, Author: $author, Year: $year');
  }
}

class Library {

  List<Book> _books = [];

  void addBook(Book book) {
    _books.add(book);
    print('Book "${book.title}" added to the library.');
  }
  void removeBook(String title) {
    bool found = false;
    for (int i = 0; i < _books.length; i++) {
      if (_books[i].title.toLowerCase() == title.toLowerCase()) {
        _books.removeAt(i);
        found = true;
        print('Book "$title" removed from the library.');
        break;
      }
    }
    if (!found) {
      print('Book "$title" not found in the library.');
    }
  }
  void displayBooks() {
    if (_books.isEmpty) {
      print('No books in the library.');
    } else {
      print('\nBooks in the Library:');
      for (Book book in _books) {
        book.display();
      }
    }
  }
}