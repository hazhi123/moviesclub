// import '../../../views/splash/components/logo.dart';
// import '../../../utils/utils.dart';

// class LayoutSplashComponent extends StatelessWidget {
//   final Widget child;
//   final bool animated, opacity, isImage, isCenter, isSingle;

//   const LayoutSplashComponent({
//     Key? key,
//     required this.child,
//     this.animated = true,
//     this.opacity = true,
//     this.isImage = true,
//     this.isCenter = false,
//     this.isSingle = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Widget single = SingleChildScrollView(
//       child: child,
//     );

//     Widget center = Center(
//       child: child,
//     );

//     return Container(
//       color: Colors.black,
//       child: Stack(
//         fit: StackFit.expand,
//         children: [
//           Opacity(
//             opacity: 0.3,
//             child: imageSui(fondoLoginImg, isCover: true),
//           ),
//           SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 if (isImage) const LogoComponent(),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 35),
//                     child: isCenter
//                         ? center
//                         : isSingle
//                             ? single
//                             : child,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
