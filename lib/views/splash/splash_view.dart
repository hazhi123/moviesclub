import 'package:flutter/material.dart';
import 'package:sotaui/sotaui.dart' hide loadingLot;

import '../../routes/page_view.dart';
import '../../utils/utils.dart';

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
      body: Stack(
        fit: StackFit.expand,
        children: [
          imageSui(
            fondoImg,
            isCover: true,
          ),
          Positioned(
            bottom: 0,
            left: 10,
            child: FadeIn(
              child: lottieSui(
                loadingLot,
                size: wpSui(context, size: 60),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 15,
            child: SlideInDown(
              child: TextSui(
                'Movies Club',
                size: wpSui(context, size: 10),
                bold: true,
                white: true,
                center: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
