import 'package:sotaui/sotaui.dart';

import '../views/views.dart';

const String splashRoute = '/splash';
splashView() => PageTransition(
      type: PageTransitionType.fade,
      child: const SplashView(),
    );

const String introRoute = '/intro';
introView() => PageTransition(
      type: PageTransitionType.fade,
      child: const IntroView(),
    );

const String inicioRoute = '/inicio';
inicioView() => PageTransition(
      type: PageTransitionType.fade,
      child: const InicioView(),
    );

// Movies

const String moviesRoute = '/movies';
moviesView() => PageTransition(
      type: PageTransitionType.fade,
      child: const MoviesView(),
    );

const String detallesMovieRoute = '/detallesMovie';
detallesMovieView() => PageTransition(
      type: PageTransitionType.rightToLeft,
      child: const DetallesMovieView(),
    );
