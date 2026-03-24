import 'package:flutter/material.dart';
import 'package:hw/data/repositories/artists/artist_repository.dart';
import 'package:hw/ui/screens/artists/view_model/artist_view_model.dart';
import 'package:hw/ui/screens/artists/widgets/artist_content.dart';
import 'package:provider/provider.dart';

class ArtistScreen extends StatelessWidget {
  const ArtistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ArtistRepository artistRepository = context.read<ArtistRepository>();
    return ChangeNotifierProvider(
      create: (_) => ArtistViewModel(artistRepository: artistRepository),
      child: ArtistContent(),
    );
  }
}
