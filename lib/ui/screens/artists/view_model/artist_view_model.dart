import 'package:flutter/material.dart';
import 'package:hw/data/repositories/artists/artist_repository.dart';
import 'package:hw/model/artists/artist.dart';
import 'package:hw/ui/utils/async_value.dart';

class ArtistViewModel extends ChangeNotifier {
  final ArtistRepository _artistRepository;

  ArtistViewModel({required ArtistRepository artistRepository})
    : _artistRepository = artistRepository {
    init();
  }
  AsyncValue<List<Artist>> artistsValue = AsyncValue.loading();

  void init() {
    fetchArtists();
  }

  void fetchArtists() async {
    artistsValue = AsyncValue.loading();
    notifyListeners();
    try {
      List<Artist> artists = await _artistRepository.fetchArtists();
      artistsValue = AsyncValue.success(artists);
    } catch (e) {
      artistsValue = AsyncValue.error(e);
    }
    notifyListeners();
  }
}
