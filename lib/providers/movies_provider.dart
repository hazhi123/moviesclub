import 'package:flutter/material.dart';
import 'package:sotaui/utils/utils.dart';

import '../services/services.dart';

const String popularConst = 'popular';
const String topRatedConst = 'top_rated';

class MoviesProvider with ChangeNotifier {
  bool _loading = false;
  get loading => _loading;

  //--------------------------------------------------
  // Lsta de todos los registros
  //==================================================

  List<MovieModel> _allPopular = [];
  get allPopular => _allPopular;

  List<MovieModel> _allTopRated = [];
  get allTopRated => _allTopRated;

  Future<List<MovieModel>> getAll(
    query, {
    bool listen = false,
  }) async {
    if (_allPopular.isNotEmpty && query == popularConst) return _allPopular;
    if (_allTopRated.isNotEmpty && query == topRatedConst) return _allTopRated;

    GetAllMoviesModel res = await MoviesService.getAll(query);

    if (query == popularConst) {
      _allPopular = res.results!;
    } else {
      _allTopRated = res.results!;
    }

    if (listen) {
      notifyListeners();
    }
    return res.results!;
  }

  //--------------------------------------------------
  // Registro activo
  //==================================================
  MovieModel? _activo;
  get activo => _activo;
  set activo(data) {
    _activo = data;
    _loading = true;
    notifyListeners();
    timerSui(2, () {
      _loading = false;
      notifyListeners();
    });
  }

  //--------------------------------------------------
  // Filtro de registro
  //==================================================
  List<MovieModel> _filtroPopular = [];
  get filtroPopular => _filtroPopular;

  List<MovieModel> _filtroTopRated = [];
  get filtroTopRated => _filtroTopRated;

  getFiltro(String tipo, String value) {
    if (tipo == popularConst) {
      if (_filtroTopRated.isNotEmpty) _filtroTopRated.clear();
      _filtroPopular = _allPopular
          .where((MovieModel el) =>
              el.title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    } else {
      if (_filtroPopular.isNotEmpty) _filtroPopular.clear();
      _filtroTopRated = _allTopRated
          .where((MovieModel el) =>
              el.title!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }

  clearfiltro() {
    _filtroPopular.clear();
    _filtroTopRated.clear();
  }

  bool _search = false;
  get search => _search;
  set search(data) {
    _search = data;
    notifyListeners();
  }
}
