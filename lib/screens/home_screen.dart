import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtoon_explorer/providers/webtoon_provider.dart';

import '../widgets/webtoon_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WebtoonProvider>(
        builder: (context, webtoonProvider, child) {
      final webtoons = webtoonProvider.webtoons;

      // If no webtoons are available, show a loading or empty message
      if (webtoons.isEmpty) {
        return const Center(child: CircularProgressIndicator());
      }

      // Display webtoons using ListView
      return Scaffold(
        backgroundColor: Colors.grey[300],
        body: ListView.builder(
            itemCount: webtoons.length,
            itemBuilder: (context, index) {
              final webtoon = webtoons[index];
              return WebtoonItem(webtoon: webtoon);
            }),
      );
    });
  }
}
