// import 'package:flutter/material.dart';
//
// class QRCheckButton extends StatelessWidget {
//   const QRCheckButton({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         popNavigateEmployee(context);
//       },
//       child: Container(
//         height: screenHeight/4,
//         width: screenWidth/2,
//         margin: const EdgeInsets.only(top: 15),
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.black26,
//                 blurRadius: 10,
//                 offset: Offset(2, 2),
//               )
//             ]),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center ,
//           children: [
//             const Stack(
//               alignment: Alignment.center,
//               children: [
//                 Icon(
//                   FontAwesomeIcons.expand,
//                   size: 70,
//                 ),
//                 Icon(
//                   FontAwesomeIcons.camera,
//                   size: 25,
//                 )
//               ],
//             ),
//             Container(
//               margin: const EdgeInsets.only(top: 15),
//               child: Text(
//                 'Scan to Check In',
//                 style: TextStyle(
//                   color: Colors.black87,
//                   fontSize: screenWidth/20,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     ),;
//   }
// }
