import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:sotaui/sotaui.dart';
import 'providers/providers.dart';
import 'routes/page_view.dart';
import 'routes/routes.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.appName,
  }) : super(key: key);

  final String appName;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(),
      child: MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        initialRoute: splashRoute,
        onGenerateRoute: Routes.pages,
      ),
    );
  }

  providers() => [
        ChangeNotifierProvider(create: (context) => SplashProvider()),
        ChangeNotifierProvider(create: (context) => IntroProvider()),
        ChangeNotifierProvider(create: (context) => InicioProvider()),
        ChangeNotifierProvider(create: (context) => MoviesProvider()),
      ];
}
