import 'package:flutter/material.dart';
import 'package:sotaui/sotaui.dart';

import '../../../config/config.dart';
import '../../../services/models/models.dart';
import 'image.dart';

class CardMoviesComponent extends StatelessWidget {
  const CardMoviesComponent({
    Key? key,
    required this.data,
    required this.onPressed,
    this.loading = false,
  }) : super(key: key);

  final MovieModel data;
  final VoidCallback onPressed;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: ButtonSui(
        height: 140,
        width: wpSui(context),
        color: Colors.white,
        onPressed: onPressed,
        child: Row(
          children: <Widget>[
            ImageComponent(
              image: Apis.baseImg + data.posterPath!,
              size: 50,
              id: data.id!,
              loading: loading,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextSui(
                    data.title!,
                    size: 16,
                    bold: true,
                  ),
                  Expanded(
                    child: TextSui(
                      data.overview!,
                      overflow: true,
                      maxLines: 3,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
