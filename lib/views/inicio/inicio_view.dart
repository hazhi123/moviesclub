import 'package:flutter/material.dart';
import 'package:sotaui/sotaui.dart';

import '../../providers/providers.dart';
import '../../routes/page_view.dart';
import '../../services/services.dart';
import '../../widgets/loading.dart';
import 'components/card_carrusel.dart';

class InicioView extends StatefulWidget {
  const InicioView({Key? key}) : super(key: key);

  @override
  _InicioViewState createState() => _InicioViewState();
}

class _InicioViewState extends State<InicioView> {
  late InicioProvider inicioProvider;
  late MoviesProvider moviesProvider;
  late Future<List<MovieModel>> futureGetAll;

  @override
  void initState() {
    inicioProvider = Provider.of<InicioProvider>(
      context,
      listen: false,
    );
    super.initState();
    futureGetAll = inicioProvider.getAllMovie(popularConst);
  }

  @override
  Widget build(BuildContext contex) {
    inicioProvider = Provider.of<InicioProvider>(context);
    moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const TextSui(
          'Movies Club',
          size: 30,
          bold: true,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: ButtonSui(
              onPressed: () {
                Navigator.pushNamed(context, moviesRoute);
              },
              type: iconConst,
              icon: Icons.movie_filter_sharp,
              iconSize: 40,
            ),
          )
        ],
      ),
      body: future(),
    );
  }

  future() {
    return FutureBuilder<List<MovieModel>>(
      future: futureGetAll,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: SearchSui(
                      thint: 'Buscar película',
                      onChanged: (value) {
                        inicioProvider.getFiltro(value);
                      },
                    ),
                  ),
                  const TextSui(
                    'Populares',
                    size: 30,
                    bold: true,
                  ),
                  carrusel(),
                ],
              ),
            ),
          );
        }
        if (snapshot.hasError) {
          return const Center(
            child: TextSui('Error de carga'),
          );
        }

        return const LoadingComponent();
      },
    );
  }

  carrusel() {
    return CarouselSlider.builder(
      options: CarouselOptions(
        height: hpSui(context, size: 67),
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: inicioProvider.filtro.isNotEmpty
          ? inicioProvider.filtro.length
          : inicioProvider.allMovie.length,
      itemBuilder: (BuildContext context, int index, int pageViewIndex) {
        MovieModel item = inicioProvider.filtro.isNotEmpty
            ? inicioProvider.filtro[index]
            : inicioProvider.allMovie[index];
        return CardCarruselComponent(
          data: item,
          loading:
              moviesProvider.loading && item.id == moviesProvider.activo.id,
          onPressed: () {
            if (moviesProvider.loading) return;
            moviesProvider.activo = item;
            timerSui(2, () {
              Navigator.pushNamed(context, detallesMovieRoute);
            });
          },
        );
      },
    );
  }
}
