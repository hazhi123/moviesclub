import 'package:avamovies/routes/page_view.dart';
import 'package:flutter/material.dart';
import 'package:sotaui/sotaui.dart';

import '../../../providers/providers.dart';
import '../../../services/services.dart';
import '../../../widgets/widgets.dart';
import 'card_movies.dart';

class ListaMoviesComponent extends StatefulWidget {
  final String tipo;
  const ListaMoviesComponent({
    Key? key,
    this.tipo = '',
  }) : super(key: key);

  @override
  State<ListaMoviesComponent> createState() => _ListaMoviesComponentState();
}

class _ListaMoviesComponentState extends State<ListaMoviesComponent> {
  late MoviesProvider moviesProvider;
  late Future<List<MovieModel>> futureGetAll;

  @override
  void initState() {
    moviesProvider = Provider.of<MoviesProvider>(
      context,
      listen: false,
    );
    super.initState();
    futureGetAll = moviesProvider.getAll(widget.tipo);
  }

  @override
  Widget build(BuildContext context) {
    moviesProvider = Provider.of<MoviesProvider>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SearchSui(
            thint: 'Buscar película',
            onChanged: (value) {
              moviesProvider.getFiltro(widget.tipo, value);
            },
          ),
        ),
        Expanded(
          child: future(),
        ),
      ],
    );
  }

  future() {
    return FutureBuilder<List<MovieModel>>(
      future: futureGetAll,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return lista(snapshot.data);
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

  lista(lista) {
    List<MovieModel> filtro = widget.tipo == popularConst
        ? moviesProvider.filtroPopular
        : moviesProvider.filtroTopRated;
    return ListView.builder(
      itemCount: filtro.isNotEmpty ? filtro.length : lista.length,
      itemBuilder: (BuildContext context, int index) {
        MovieModel item = filtro.isNotEmpty ? filtro[index] : lista[index];
        return CardMoviesComponent(
          loading:
              moviesProvider.loading && item.id == moviesProvider.activo.id,
          data: item,
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
