import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class LayoutSplashComponent extends StatelessWidget {
  final Widget child;

  const LayoutSplashComponent({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // color: Colors.black,
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, primaryColor],
        ),
      ),
      child: child,
    );
  }
}
