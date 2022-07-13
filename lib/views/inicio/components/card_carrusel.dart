import 'package:avamovies/config/apis.dart';
import 'package:flutter/material.dart';
import 'package:sotaui/sotaui.dart';

import '../../../services/models/models.dart';
import '../../../widgets/widgets.dart';

class CardCarruselComponent extends StatelessWidget {
  final MovieModel data;
  final VoidCallback onPressed;
  final bool loading;

  const CardCarruselComponent({
    Key? key,
    required this.data,
    required this.onPressed,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BorderRadius radius = BorderRadius.circular(15);

    return ButtonSui(
      onPressed: onPressed,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: radius,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            imageUrlSui(
              Apis.baseImg + data.posterPath!,
              isCover: true,
              hero: '${data.id}',
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 80,
                  child: Align(
                    alignment: Alignment.center,
                    child: footer(context),
                  ),
                ),
              ],
            ),
            if (loading)
              Container(
                color: Colors.white54,
                child: const LoadingComponent(isText: false),
              ),
          ],
        ),
      ),
    );
  }

  footer(context) {
    return Container(
      padding: const EdgeInsets.all(15),
      color: Colors.black87,
      width: wpSui(context, size: 70),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextSui(
        data.title ?? 'Title Movies',
        size: 20,
        white: true,
        bold: true,
        center: true,
      ),
    );
  }
}
