import 'package:avamovies/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:sotaui/sotaui.dart';

import '../../routes/page_view.dart';
import '../splash/components/layout_component.dart';

class IntroView extends StatefulWidget {
  const IntroView({Key? key}) : super(key: key);

  @override
  _IntroViewState createState() => _IntroViewState();
}

class _IntroViewState extends State<IntroView> {
  final CarouselController _carouselController = CarouselController();

  int slider = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: LayoutSplashComponent(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            carrusel(),
            Positioned(
              bottom: 40,
              child: SizedBox(
                width: wpSui(context),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    if (slider != 0)
                      ButtonSui(
                        onPressed: () {
                          _carouselController.previousPage();
                        },
                        text: 'Volver',
                      ),
                    ButtonSui(
                      onPressed: () {
                        if (slider == 2) {
                          Navigator.pushReplacementNamed(context, inicioRoute);
                        } else {
                          _carouselController.nextPage();
                        }
                      },
                      type: outlinedConst,
                      text: slider == 2 ? 'Continuar' : 'Siguiente',
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  carrusel() {
    // var info = [];

    return CarouselSlider(
      carouselController: _carouselController,
      options: CarouselOptions(
        initialPage: slider,
        enableInfiniteScroll: false,
        onPageChanged: (value, _) {
          setState(() {
            slider = value;
          });
        },
        height: hpSui(context),
        viewportFraction: 1.0,
      ),
      items: [1, 2, 3].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      imageSui(logoImg, size: 300),
                      TextSui(
                        'TITULO $i',
                        size: 25,
                        bold: true,
                        padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                      const TextSui(
                        'Consectetur sit sunt ut anim officia esse ullamco aliquip deserunt aliqua aute minim fugiat officia. Adipisicing ex dolore et fugiat nisi. Tempor velit laboris esse duis sit ea aute deserunt et quis amet ad.',
                        center: true,
                      ),
                    ],
                  ),
                ));
          },
        );
      }).toList(),
    );
  }
}
