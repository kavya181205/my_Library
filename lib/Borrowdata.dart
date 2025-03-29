class Borrow {
  final String transactionId;
  final String userId;
  final String bookId;
  final String bookName;
  final String libraryId;
  final DateTime issueDate;
  final DateTime returnDate;
  final double penalty;
  final int latency; // in days

  Borrow({
    required this.transactionId,
    required this.userId,
    required this.bookId,
    required this.bookName,
    required this.libraryId,
    required this.issueDate,
    required this.returnDate,
    required this.penalty,
    required this.latency,
  });
}

List<Borrow> borrowList = [
  Borrow(
    transactionId: "TXN001",
    userId: "USR123",
    bookId: "BK101",
    bookName: "Flutter for Beginners",
    libraryId: "LIB001",
    issueDate: DateTime(2025, 3, 1),
    returnDate: DateTime(2025, 3, 15),
    penalty: 0.0,
    latency: 0,
  ),
  Borrow(
    transactionId: "TXN002",
    userId: "USR456",
    bookId: "BK102",
    bookName: "Dart Programming Guide",
    libraryId: "LIB002",
    issueDate: DateTime(2025, 2, 25),
    returnDate: DateTime(2025, 3, 10),
    penalty: 20.0,
    latency: 2,
  ),
  Borrow(
    transactionId: "TXN003",
    userId: "USR789",
    bookId: "BK103",
    bookName: "Advanced Flutter UI",
    libraryId: "LIB003",
    issueDate: DateTime(2025, 3, 5),
    returnDate: DateTime(2025, 3, 20),
    penalty: 0.0,
    latency: 0,
  ),
  Borrow(
    transactionId: "TXN004",
    userId: "USR101",
    bookId: "BK104",
    bookName: "Effective Dart",
    libraryId: "LIB001",
    issueDate: DateTime(2025, 2, 20),
    returnDate: DateTime(2025, 3, 5),
    penalty: 50.0,
    latency: 5,
  ),
  Borrow(
    transactionId: "TXN005",
    userId: "USR202",
    bookId: "BK105",
    bookName: "Clean Code",
    libraryId: "LIB002",
    issueDate: DateTime(2025, 3, 10),
    returnDate: DateTime(2025, 3, 25),
    penalty: 0.0,
    latency: 0,
  ),
];
