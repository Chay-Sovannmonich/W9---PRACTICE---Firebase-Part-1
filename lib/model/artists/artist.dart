class Artist {
  final String name;
  final String genre;
  final Uri imageUrl;

  const Artist({
    required this.name,
    required this.genre,
    required this.imageUrl,
  
  });

  @override
  String toString() {
    return 'Song(name: $name, genre: $genre, image url: $imageUrl)';
  }
}