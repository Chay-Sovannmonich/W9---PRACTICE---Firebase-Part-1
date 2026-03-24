import '../../dtos/artists/artist_dto.dart';
import '../../../model/artists/artist.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'artist_repository.dart';

class ArtistRepositoryFirebase extends ArtistRepository {
  final Uri artistUri = Uri.https('thurs19-e62f4-default-rtdb.asia-southeast1.firebasedatabase.app','/artists.json',
  );

  @override
  Future<List<Artist>> fetchArtists() async {
    final http.Response response = await http.get(artistUri);
    if (response.statusCode == 200) {
      Map<String, dynamic> artistJson = json.decode(response.body);
      final List<Artist> artists = [];

      for (var artist in artistJson.entries) {
        artists.add(ArtistDto.fromJson(artist.value));
      }
      return artists;
    } else {
      throw Exception('failed to load artists');
    }
  }
}