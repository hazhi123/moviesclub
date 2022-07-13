import 'package:flutter/material.dart';
import 'package:sotaui/sotaui.dart';

import '../../../config/config.dart';
import '../../../services/services.dart';
import 'image.dart';

class InfoComponent extends StatelessWidget {
  const InfoComponent({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final MovieModel movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        const SizedBox(height: 300),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ImageComponent(
                  image: Apis.baseImg + movie.posterPath!,
                  id: movie.id!,
                ),
                const SizedBox(height: 5),
                SizedBox(
                  width: 140,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.star_border_purple500,
                              color: Colors.white,
                            ),
                            TextSui(
                              movie.voteAverage!.toString(),
                              white: true,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.people,
                              color: Colors.white,
                            ),
                            TextSui(
                              movie.voteCount!.toString(),
                              white: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextSui(
                      movie.title ?? 'Movie',
                      white: true,
                      size: 25,
                      bold: true,
                      left: true,
                    ),
                    const SizedBox(height: 15),
                    info('Lenguaje: ', movie.originalLanguage!),
                    info('Adulto: ', movie.adult! ? 'Si' : 'No'),
                    info('Lanzamiento: ', movie.releaseDate!),
                    info('Popularidad: ', movie.popularity!.toString()),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  info(String title, String text) {
    return Row(
      children: <Widget>[
        TextSui(
          title,
          bold: true,
          white: true,
        ),
        TextSui(
          text,
          white: true,
        ),
      ],
    );
  }
}
