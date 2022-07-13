import 'package:flutter/material.dart';
import 'package:sotaui/sotaui.dart';

import '../../config/apis.dart';
import '../../providers/providers.dart';
import '../../services/models/models.dart';
import 'components/info.dart';

class DetallesMovieView extends StatefulWidget {
  const DetallesMovieView({Key? key}) : super(key: key);

  @override
  State<DetallesMovieView> createState() => _DetallesMovieViewState();
}

class _DetallesMovieViewState extends State<DetallesMovieView> {
  late MoviesProvider moviesProvider;

  @override
  Widget build(BuildContext context) {
    moviesProvider = Provider.of<MoviesProvider>(context);
    MovieModel movie = moviesProvider.activo;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          fondo(),
          gradiente(),
          SingleChildScrollView(
            child: Column(
              children: [
                InfoComponent(movie: movie),
                TextSui(
                  movie.overview!,
                  white: true,
                  padding: const EdgeInsets.all(15),
                ),
              ],
            ),
          ),
          Positioned(
            top: 40,
            left: 10,
            child: ButtonSui(
              onPressed: () {
                Navigator.pop(context);
              },
              size: 50,
              rounded: 25,
              icon: Icons.arrow_back,
              iconSize: 35,
              tWhite: true,
            ),
          ),
          if (movie.video!)
            Positioned(
              bottom: 20,
              right: 16,
              child: SizedBox(
                width: wpSui(context),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ButtonSui(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      size: 70,
                      rounded: 35,
                      icon: Icons.play_circle_outline,
                      iconSize: 50,
                      tWhite: true,
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  gradiente() {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment(0.0, -0.5),
          stops: [0.9, 1],
          colors: <Color>[
            Colors.black,
            Colors.transparent,
          ],
        ),
      ),
    );
  }

  fondo() {
    return Positioned(
      top: 0,
      child: Container(
        color: Colors.black,
        height: 300,
        width: wpSui(context),
        child: imageUrlSui(
          Apis.baseImg + moviesProvider.activo.backdropPath!,
          isCover: true,
          loadingColor: Colors.white,
        ),
      ),
    );
  }
}
