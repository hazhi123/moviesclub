import 'package:flutter/material.dart';
import 'package:sotaui/sotaui.dart' hide loadingLot;

import '../../routes/page_view.dart';
import '../../utils/utils.dart';
import 'components/layout_component.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    timerSui(5, () {
      Navigator.pushReplacementNamed(context, introRoute);
    });
  }

  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutSplashComponent(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FadeIn(
              child: lottieSui(
                loadingLot,
                size: wpSui(context, size: 60),
              ),
            ),
            SlideInUp(
              child: TextSui(
                'Movies Club',
                size: wpSui(context, size: 10),
                bold: true,
                center: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
