import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtoon_explorer/providers/webtoon_provider.dart';
import 'package:webtoon_explorer/widgets/webtoon_item.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WebtoonProvider>(
        builder: (context, webtoonProvider, child) {
      final favWebtoons = webtoonProvider.favorites;

      // If no webtoons are available, show a loading or empty message
      if (favWebtoons.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      // Display webtoons using ListView or GridView
      return Scaffold(
        backgroundColor: Colors.grey[300],
        body: ListView.builder(
            itemCount: favWebtoons.length,
            itemBuilder: (context, index) {
              final webtoon = favWebtoons[index];
              return WebtoonItem(webtoon: webtoon);
            }),
      );
    });
  }
}
