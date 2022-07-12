// import '../../utils/utils.dart';

// class SplashView extends StatefulWidget {
//   const SplashView({Key? key}) : super(key: key);

//   @override
//   _SplashViewState createState() => _SplashViewState();
// }

// class _SplashViewState extends State<SplashView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.red,
//       body: Container(
//         width: wpSui(context),
//         height: hpSui(context),
//         decoration: const BoxDecoration(
//             gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [
//             Color.fromARGB(255, 25, 178, 238),
//             Color.fromARGB(255, 21, 236, 229)
//           ],
//         )),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: const <Widget>[
//             TextSui(
//               'DATCCI',
//               white: true,
//               size: 20,
//               bold: true,
//               padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   carrusel() {
//     return CarouselSlider(
//       options: CarouselOptions(
//         height: hpSui(context),
//         viewportFraction: 1.0,
//       ),
//       items: [1, 2, 3, 4, 5].map((i) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Container(
//                 width: MediaQuery.of(context).size.width,
//                 margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                 decoration: const BoxDecoration(color: Colors.amber),
//                 child: Text(
//                   'text $i',
//                   style: const TextStyle(fontSize: 16.0),
//                 ));
//           },
//         );
//       }).toList(),
//     );
//   }
// }
