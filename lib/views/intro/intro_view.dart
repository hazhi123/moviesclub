// import '../../routes/page_view.dart';
// import '../../utils/utils.dart';

// class IntroView extends StatefulWidget {
//   const IntroView({Key? key}) : super(key: key);

//   @override
//   _IntroViewState createState() => _IntroViewState();
// }

// class _IntroViewState extends State<IntroView> {
//   final CarouselController _carouselController = CarouselController();

//   int slider = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.red,
//       body: Container(
//         width: wpSui(context),
//         height: hpSui(context),
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [primaryColor, primaryLigthColor],
//           ),
//         ),
//         child: Stack(
//           fit: StackFit.expand,
//           children: <Widget>[
//             carrusel(),
//             Positioned(
//               bottom: 40,
//               child: SizedBox(
//                 width: wpSui(context),
//                 height: 50,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: <Widget>[
//                     if (slider != 0)
//                       ButtonSui(
//                         onPressed: () {
//                           _carouselController.previousPage();
//                         },
//                         text: 'Volver',
//                         tColor: primaryDarkColor,
//                       ),
//                     ButtonSui(
//                       onPressed: () {
//                         if (slider == 2) {
//                           Navigator.pushReplacementNamed(context, loginRoute);
//                         } else {
//                           _carouselController.nextPage();
//                         }
//                       },
//                       type: outlinedConst,
//                       text: slider == 2 ? 'Continuar' : 'Siguiente',
//                       color: primaryDarkColor,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   carrusel() {
//     // var info = [];

//     return CarouselSlider(
//       carouselController: _carouselController,
//       options: CarouselOptions(
//         initialPage: slider,
//         enableInfiniteScroll: false,
//         onPageChanged: (value, _) {
//           setState(() {
//             slider = value;
//           });
//         },
//         height: hpSui(context),
//         viewportFraction: 1.0,
//       ),
//       items: [1, 2, 3].map((i) {
//         return Builder(
//           builder: (BuildContext context) {
//             return SizedBox(
//                 width: MediaQuery.of(context).size.width,
//                 // margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                 // decoration: const BoxDecoration(color: Colors.black26),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       imageSui(dashImg, size: 300),
//                       TextSui(
//                         'TITULO $i',
//                         size: 25,
//                         bold: true,
//                         white: true,
//                       ),
//                       const TextSui(
//                         'Consectetur sit sunt ut anim officia esse ullamco aliquip deserunt aliqua aute minim fugiat officia. Adipisicing ex dolore et fugiat nisi. Tempor velit laboris esse duis sit ea aute deserunt et quis amet ad. Voluptate reprehenderit exercitation do et cupidatat fugiat incididunt minim quis. Velit ex magna eiusmod consequat sint amet voluptate incididunt excepteur velit excepteur in reprehenderit adipisicing. Aliquip officia ipsum fugiat labore consequat voluptate veniam ad.',
//                         center: true,
//                       ),
//                     ],
//                   ),
//                 ));
//           },
//         );
//       }).toList(),
//     );
//   }
// }
