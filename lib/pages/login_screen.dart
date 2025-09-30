// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:placeme/authentication/google_authentication.dart';
// import 'package:placeme/pages/main_screen.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: SafeArea(
//           bottom: false,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Text(
//                   "Log in or Sign Up",
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               Divider(color: Colors.black),
//               Padding(
//                 padding: EdgeInsets.all(10),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "Welcome to Placeme",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.02),
//                     phoneNumberField(size),
//                     const SizedBox(height: 10),
//                     RichText(
//                       text: const TextSpan(
//                         text: "welcome badinggggg",
//                         style: TextStyle(fontSize: 15, color: Colors.black),
//                         children: [
//                           TextSpan(
//                             text: " privacy policy",
//                             style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               decoration: TextDecoration.underline,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.03),
//                     Container(
//                       width: size.width,
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.red,
//                       ),
//                       child: Center(
//                         child: Text(
//                           "Continue mo na",
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: size.height * 0.026),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Container(height: 1, color: Colors.black),
//                         ),
//                         const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 20),
//                           child: Text("or", style: TextStyle(fontSize: 18)),
//                         ),
//                         Expanded(
//                           child: Container(height: 1, color: Colors.black),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: size.height * 0.015),
//                     socialIcon(
//                       size,
//                       Icons.facebook,
//                       "Continue with Facebook",
//                       Colors.blue,
//                       30,
//                     ),
//                     // InkWell(
//                     //   onTap: () async {
//                     //     await FirebaseAuthServices().signInWithGoogle();
//                     //     Navigator.pushReplacement(
//                     //       context,
//                     //       MaterialPageRoute(
//                     //         builder: (context) => const AppMainScreen(),
//                     //       ),
//                     //     );
//                     //   },
//                     //   child: socialIcon(
//                     //     size,
//                     //     FontAwesomeIcons.google,
//                     //     "Continue with Google",
//                     //     Colors.black,
//                     //     27,
//                     //   ),
//                     // ),
//                       InkWell(
//                       onTap: () async {
//                         final navigator = Navigator.of(context);
//                         await FirebaseAuthServices().signInWithGoogle();
//                         navigator.pushReplacement(
//                           MaterialPageRoute(
//                             builder: (context) => const AppMainScreen(),
//                           ),
//                         );
//                       },
//                       child: socialIcon(
//                         size,
//                         FontAwesomeIcons.google,
//                         "Continue with Google",
//                         Colors.black,
//                         27,
//                       ),
//                     ),
                    
//                     socialIcon(
//                       size,
//                       Icons.apple,
//                       "Continue with Apple",
//                       Colors.black,
//                       30,
//                     ),
//                     socialIcon(
//                       size,
//                       Icons.email_outlined,
//                       "Continue with Email",
//                       Colors.black,
//                       30,
//                     ),
//                     const SizedBox(height: 10),
//                     const Center(
//                       child: Text(
//                         "need mo ba ng help tanga ka pa naman?",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 17,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Padding socialIcon(Size size, icon, name, color, double iconSize) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 15),
//       child: Container(
//         width: size.width,
//         padding: EdgeInsets.symmetric(vertical: 11),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(),
//         ),
//         child: Row(
//           children: [
//             SizedBox(width: size.width * 0.05),
//             Icon(icon, color: color, size: iconSize),
//             SizedBox(width: size.width * 0.18),
//             Text(
//               name,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
//             ),
//             SizedBox(width: 10),
//           ],
//         ),
//       ),
//     );
//   }

//   Container phoneNumberField(Size size) {
//     return Container(
//       width: size.width,
//       height: 130,
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(right: 10, left: 10, top: 8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text("Country/Origin", style: TextStyle(color: Colors.black)),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "pilipins(+63)",
//                       style: TextStyle(color: Colors.black, fontSize: 20),
//                     ),
//                     Icon(Icons.keyboard_arrow_down_sharp, size: 30),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           Divider(),
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             child: TextField(
//               decoration: InputDecoration(
//                 hintText: "phone mo tanga",
//                 hintStyle: TextStyle(fontSize: 18, color: Colors.black),
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
