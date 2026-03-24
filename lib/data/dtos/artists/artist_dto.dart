import 'package:hw/model/artists/artist.dart';

class ArtistDto {
  static const nameKey = 'name';
  static const genreKey = 'genre';
  static const imageUrlKey = 'imageUrl';
  static Artist fromJson(Map<String, dynamic> json) {
    assert(json[nameKey] is String);
    assert(json[genreKey] is String);
    assert(json[imageUrlKey] is String);
    return Artist(
      name: json[nameKey],
      genre: json[genreKey],
      imageUrl: Uri.parse(json[imageUrlKey]),
    );
  }
   Map<String, dynamic> toJson(Artist artist) {
    return {
      nameKey: artist.name,
      genreKey: artist.genre,
      imageUrlKey: artist.imageUrl.toString(),
    };
  }
}
