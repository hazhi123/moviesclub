import 'package:avamovies/utils/image_util.dart';
import 'package:flutter/material.dart';
import 'package:sotaui/sotaui.dart';

class LogoComponent extends StatelessWidget {
  const LogoComponent({
    Key? key,
    this.size,
  }) : super(key: key);

  final int? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 30, 0, 20),
        child: imageSui(
          logoImg,
          size: wpSui(context, size: size ?? 25),
          hero: 'logo',
          color: Colors.white,
        ),
      ),
    );
  }
}
