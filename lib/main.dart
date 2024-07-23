import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reading List App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<String> books = [
    'The Great Gatsby',
    '1984',
    'To Kill a Mockingbird',
    'The Catcher in the Rye',
    'Moby-Dick'
  ];

  String selectedCategory = 'Want to Read';

  void switchCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reading List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Handle profile action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for a book...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                // Implement search logic
              },
            ),
          ),
          // Category Tabs
          Container(
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CategoryTab(title: 'Want to Read', onTap: switchCategory),
                CategoryTab(title: 'Currently Reading', onTap: switchCategory),
                CategoryTab(title: 'Finished', onTap: switchCategory),
              ],
            ),
          ),
          // Grid View for Books
          Expanded(
            child: SizedBox(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: books.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BookDetailPage(bookTitle: books[index]),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          // Fetching the book cover image from the web
                          SizedBox(
                            width: 100, // Set a fixed width
                            height: 150, // Set a fixed height
                            child: Image.network(
                              _getBookCoverUrl(index),
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(Icons
                                    .error); // Display an error icon if the image fails to load
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              books[index],
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new book
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  String _getBookCoverUrl(int index) {
    switch (index) {
      case 0:
        return 'https://books.google.com.my/books/publisher/content?id=WpD_DAAAQBAJ&pg=PP1&img=1&zoom=3&hl=en&bul=1&sig=ACfU3U2smY1XG0tjSZpqcsPWGRs18i-NFg&w=1280';
      case 1:
        return 'https://books.google.com.my/books/publisher/content?id=XsqoEAAAQBAJ&pg=PP1&img=1&zoom=3&hl=en&bul=1&sig=ACfU3U2B4Abt4v62TmdvbzG0slBGaAiNHA&w=1280'; // 1984
      case 2:
        return 'https://books.google.com.my/books/publisher/content?id=-D8WBAAAQBAJ&pg=PP1&img=1&zoom=3&hl=en&bul=1&sig=ACfU3U3AwaumJtl84JUpuJEBFvfIHCKKvA&w=1280'; // To Kill a Mockingbird
      case 3:
        return 'https://images-na.ssl-images-amazon.com/images/I/81OthjkJBuL.jpg'; // The Catcher in the Rye
      case 4:
        return 'https://books.google.com.my/books/content?id=vzdbUH74-z4C&pg=PP1&img=1&zoom=3&hl=en&bul=1&sig=ACfU3U2P_UAyHOee7R73oS2jMB5E2d88Yg&w=1280'; // Moby-Dick
      default:
        return '';
    }
  }
}

class CategoryTab extends StatelessWidget {
  final String title;
  final ValueChanged<String> onTap; // Callback for category switch

  const CategoryTab({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(title); // Call the callback with the category title
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(color: Colors.deepPurple),
          ),
        ),
      ),
    );
  }
}

class BookDetailPage extends StatelessWidget {
  final String bookTitle;

  const BookDetailPage({super.key, required this.bookTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(bookTitle)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bookTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            const Text(
              'Book details will be displayed here. You can add more information about the book, such as author, synopsis, and reading progress.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
