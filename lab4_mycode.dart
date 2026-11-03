
mixin Loggable {
  void logAction(String action) {
    print('[LOG]: System recorded action -> $action');
  }
}


abstract class Describable {
  String getDetails(); 
}


class Book implements Describable {
  String title;
  String author;
  double price;

  Book(this.title, this.author, this.price);


  @override
  String getDetails() {
    return 'Title: $title | Author: $author | Price: ₱${price.toStringAsFixed(2)}';
  }


  void displayCategory() {
    print('Category: General Reading Material');
  }
}


class EBook extends Book with Loggable {
  double fileSizeMB;

  EBook(String title, String author, double price, this.fileSizeMB)
      : super(title, author, price);


  @override
  void displayCategory() {
    print('Category: Digital E-Book (${fileSizeMB}MB)');
  }
}


class PrintedBook extends Book with Loggable {
  int pageCount;

  PrintedBook(String title, String author, double price, this.pageCount)
      : super(title, author, price);


  @override
  void displayCategory() {
    print('Category: Physical Hardcover ($pageCount pages)');
  }
}

void main() {
  print('==================================================');
  print('\tADVANCED LIBRARY SYSTEM\t');
  print('==================================================\n');


  EBook digitalBook = EBook('Mobile Dev Guide', 'Warren A.', 350.0, 15.5);
  PrintedBook physicalBook = PrintedBook('Python Programming 2', 'Paulo P.', 500.0, 320);

  print('--- Testing EBook ---');
  print(digitalBook.getDetails());
  digitalBook.displayCategory();
  digitalBook.logAction('Downloaded EBook'); 

  print('\n--- Testing PrintedBook ---');
  print(physicalBook.getDetails());
  physicalBook.displayCategory();
  physicalBook.logAction('Checked out PrintedBook'); 

  print('\n==================================================');
  print('Program executed successfully.');
}