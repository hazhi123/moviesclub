import 'package:flutter/material.dart';
import 'package:sotaui/sotaui.dart';

class LoadingComponent extends StatelessWidget {
  final bool isText;
  final double size;

  const LoadingComponent({
    Key? key,
    this.isText = true,
    this.size = 100.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeIn(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            lottieSui(
              loadingLot,
              size: size,
            ),
            if (isText) const TextSui('Cargando...')
          ],
        ),
      ),
    );
  }
}
