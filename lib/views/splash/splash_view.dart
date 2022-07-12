// import 'package:flutter/material.dart';
// import 'components/layout_splash.dart';

// class SplashView extends StatefulWidget {
//   const SplashView({Key? key}) : super(key: key);

//   @override
//   _SplashViewState createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   @override
//   void initState() {
//     super.initState();
//     timerSui(3, () {
//       Navigator.pushReplacementNamed(context, modulosRoute);
//     });
//   }

//   @override
//   Widget build(BuildContext contex) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: LayoutSplashComponent(
//         isImage: false,
//         isCenter: true,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: <Widget>[
//             lottieSui(
//               loadingLot,
//               width: 200,
//               height: 100,
//               fit: BoxFit.fill,
//             ),
//             FadeInUp(
//               child: const TextSui(
//                 Config.nameProject,
//                 white: true,
//                 size: 40,
//                 bold: true,
//                 padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
