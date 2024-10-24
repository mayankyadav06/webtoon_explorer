import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:webtoon_explorer/models/webtoon.dart';
import 'package:webtoon_explorer/providers/webtoon_provider.dart';
import 'package:webtoon_explorer/screens/detail_screen.dart';

class WebtoonItem extends StatelessWidget {
  final Webtoon webtoon;

  const WebtoonItem({
    super.key,
    required this.webtoon,
  });

  @override
  Widget build(BuildContext context) {
    /// checking if the webtoon in already in favorite or not
    bool checkFav() {
      return Provider.of<WebtoonProvider>(context, listen: false)
          .checkFavorite(webtoon.title);
    }

    /// adding or removing to favorite when favorite icon pressed
    void onFavoritePressed(Webtoon webtoon) {
      Provider.of<WebtoonProvider>(context, listen: false).addFavorite(webtoon);
    }

    /// Gesture to navigate to detail screen
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return DetailScreen(
                webtoon: webtoon,
                checkFav: checkFav,
              );
            },
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.grey[200],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          elevation: 8.0,
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0)),
                child: Stack(
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    Image.asset(webtoon.imageUrl),
                    IconButton(
                      onPressed: () => onFavoritePressed(webtoon),
                      icon: Icon(
                        Icons.favorite,
                        size: 32.0,
                        color: checkFav() ? Colors.red : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                child: Text(
                  webtoon.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18.0),
                ),
              ),
              Text(webtoon.genre, style: const TextStyle(fontSize: 16.0)),
            ],
          ),
        ),
      ),
    );
  }
}
