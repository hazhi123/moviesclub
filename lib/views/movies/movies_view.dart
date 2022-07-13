import 'package:flutter/material.dart';
import 'package:sotaui/sotaui.dart';

import '../../providers/providers.dart';
import '../../routes/page_view.dart';
import 'components/lista_movies.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> with TickerProviderStateMixin {
  late MoviesProvider moviesProvider;

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    moviesProvider = Provider.of<MoviesProvider>(
      context,
      listen: false,
    );

    _tabController = TabController(length: 2, vsync: this);
    // _tabController.animateTo(0);
  }

  @override
  void dispose() {
    moviesProvider.clearfiltro();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const TextSui(
          'Peliculas',
          size: 30,
          bold: true,
        ),
        actions: [
          ButtonSui(
            onPressed: () {
              Navigator.pushNamed(context, moviesRoute);
            },
            type: iconConst,
            icon: Icons.search,
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            width: wpSui(context),
            height: 40,
            child: TabBar(
              controller: _tabController,
              unselectedLabelColor: Colors.grey,
              labelColor: Colors.black,
              indicatorColor: Colors.black,
              tabs: const [
                Text('Populares'),
                Text('Más valorados'),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: const [
                ListaMoviesComponent(tipo: popularConst),
                ListaMoviesComponent(tipo: topRatedConst),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
