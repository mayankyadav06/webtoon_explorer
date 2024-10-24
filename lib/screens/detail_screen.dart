import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:webtoon_explorer/providers/webtoon_provider.dart';

import '../models/webtoon.dart';

class DetailScreen extends StatefulWidget {
  final Webtoon webtoon;
  final bool Function() checkFav;
  const DetailScreen(
      {super.key, required this.webtoon, required this.checkFav});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text(widget.webtoon.title),
        centerTitle: true,
      ),
      body: Column(
        children: [
          /// Thumbnail image
          Image.asset(widget.webtoon.imageUrl),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Display and allow user to rate
                  RatingBar.builder(
                    initialRating: widget.webtoon.rating,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemSize: 28.0,
                    onRatingUpdate: (rating) {
                      // Update the rating and store it
                      Provider.of<WebtoonProvider>(context, listen: false)
                          .updateRating(widget.webtoon, rating);
                    },
                  ),
                  IconButton(
                    onPressed: () =>
                        Provider.of<WebtoonProvider>(context, listen: false)
                            .addFavorite(widget.webtoon),
                    icon: Icon(
                      Icons.favorite,
                      color: widget.checkFav() ? Colors.red : Colors.grey,
                      size: 28.0,
                    ),
                  )
                ],
              ),
            ),
          ),
          Text("Genre: ${widget.webtoon.genre}"),
          Text("Creator: ${widget.webtoon.creator}"),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.webtoon.description,
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
