import 'package:flutter/material.dart';

import '../services/services.dart';

class InicioProvider with ChangeNotifier {
  final bool _loading = false;
  get loading => _loading;

  //--------------------------------------------------
  // Lsta de todos los registros
  //==================================================

  List<MovieModel> _allMovie = [];
  get allMovie => _allMovie;

  Future<List<MovieModel>> getAllMovie(
    query, {
    bool listen = false,
  }) async {
    GetAllMoviesModel res = await MoviesService.getAll(query);

    _allMovie = res.results!;
    if (listen) {
      notifyListeners();
    }
    return _allMovie;
  }

  //--------------------------------------------------
  // Filtro de registro
  //==================================================
  List<MovieModel> _filtro = [];
  get filtro => _filtro;

  getFiltro(String value) {
    _filtro = _allMovie
        .where((MovieModel el) =>
            el.title!.toLowerCase().contains(value.toLowerCase()))
        .toList();
    notifyListeners();
  }
}
