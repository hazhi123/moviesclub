import 'package:avamovies/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:sotaui/sotaui.dart';

class ImageComponent extends StatelessWidget {
  const ImageComponent({
    Key? key,
    required this.image,
    this.size = 0,
    this.loading = false,
    required this.id,
  }) : super(key: key);

  final String image;
  final int size;
  final bool loading;
  final int id;

  @override
  Widget build(BuildContext context) {
    Widget imageWidget = imageUrlSui(
      image,
      isCover: true,
      hero: '$id',
    );
    return GestureDetector(
      onTap: () {
        modalSui(
          context,
          child: imageWidget,
        );
      },
      child: Container(
        width: (140 - size).toDouble(),
        height: (210 - size).toDouble(),
        color: Colors.white,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        padding: const EdgeInsets.all(1),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            imageWidget,
            if (loading)
              Container(
                color: Colors.white54,
                child: const LoadingComponent(
                  isText: false,
                  size: 60,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
