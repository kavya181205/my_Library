class Library {
  String name;
  String address;
  String librarianName;
  String contact;
  String picturePath;

  Library({
    required this.name,
    required this.address,
    required this.librarianName,
    required this.contact,
    required this.picturePath,
  });
}

List<Library> libraryList = [
  Library(
    name: "City Central Library",
    address: "123 Main Street, Surat",
    librarianName: "Mr. Rajesh Mehta",
    contact: "9876543210",
    picturePath: "assets/images/city_central.jpg",
  ),
  Library(
    name: "Knowledge Hub",
    address: "456 Knowledge Road, Surat",
    librarianName: "Ms. Priya Sharma",
    contact: "9876543220",
    picturePath: "assets/images/knowledge_hub.jpg",
  ),
  Library(
    name: "Learning Nexus",
    address: "789 Learning Lane, Surat",
    librarianName: "Mr. Anil Kumar",
    contact: "9876543230",
    picturePath: "assets/images/learning_nexus.jpg",
  ),
  Library(
    name: "Tech Wisdom Library",
    address: "101 Tech Street, Surat",
    librarianName: "Ms. Sanya Patel",
    contact: "9876543240",
    picturePath: "assets/images/tech_wisdom.jpg",
  ),
  Library(
    name: "Readers' Paradise",
    address: "202 Bookworm Avenue, Surat",
    librarianName: "Mr. Rohit Shah",
    contact: "9876543250",
    picturePath: "assets/images/readers_paradise.jpg",
  ),
  Library(
    name: "Innovation Library",
    address: "303 Creative Road, Surat",
    librarianName: "Ms. Neha Joshi",
    contact: "9876543260",
    picturePath: "assets/images/innovation_library.jpg",
  ),
];
