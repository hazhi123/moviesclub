import 'package:flutter/material.dart';
import 'page_view.dart';

class Routes {
  static Route<dynamic>? pages(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return splashView();
      case introRoute:
        return introView();

      // Inicio
      case inicioRoute:
        return inicioView();

      // Movies
      case moviesRoute:
        return moviesView();
      case detallesMovieRoute:
        return detallesMovieView();
    }
    return null;
  }
}
