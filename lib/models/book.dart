class Book {
  final String title;
  final String author;
  final String coverUrl;
  final double rating;

  const Book(
      {required this.title,
      required this.author,
      required this.coverUrl,
      required this.rating});
}

final List<Book> books = [
  const Book(
    title: 'The Great Gatsby',
    author: 'F. Scott Fitzgerald',
    coverUrl:
        'https://books.google.com.my/books/publisher/content?id=WpD_DAAAQBAJ&pg=PP1&img=1&zoom=3&hl=en&bul=1&sig=ACfU3U2smY1XG0tjSZpqcsPWGRs18i-NFg&w=1280',
    rating: 4.5,
  ),
  const Book(
    title: '1984',
    author: 'George Orwell',
    coverUrl:
        'https://books.google.com.my/books/publisher/content?id=XsqoEAAAQBAJ&pg=PP1&img=1&zoom=3&hl=en&bul=1&sig=ACfU3U2B4Abt4v62TmdvbzG0slBGaAiNHA&w=1280',
    rating: 4.7,
  ),
  const Book(
    title: 'To Kill a Mockingbird',
    author: 'Harper Lee',
    coverUrl:
        'https://books.google.com.my/books/publisher/content?id=-D8WBAAAQBAJ&pg=PP1&img=1&zoom=3&hl=en&bul=1&sig=ACfU3U3AwaumJtl84JUpuJEBFvfIHCKKvA&w=1280',
    rating: 4.8,
  ),
  const Book(
    title: 'The Catcher in the Rye',
    author: 'J.D. Salinger',
    coverUrl:
        'https://images-na.ssl-images-amazon.com/images/I/81OthjkJBuL.jpg',
    rating: 4.2,
  ),
  const Book(
    title: 'Moby-Dick',
    author: 'Herman Melville',
    coverUrl:
        'https://books.google.com.my/books/content?id=vzdbUH74-z4C&pg=PP1&img=1&zoom=3&hl=en&bul=1&sig=ACfU3U2P_UAyHOee7R73oS2jMB5E2d88Yg&w=1280',
    rating: 4.3,
  ),
];
