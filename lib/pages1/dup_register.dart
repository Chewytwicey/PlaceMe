// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:placeme/authentication/google_authentication.dart';
// import 'package:placeme/pages1/sign_in.dart';
// import 'package:placeme/pages1/text_field.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'logo.dart';

// class RegisterPage1 extends StatefulWidget {
//   final Function()? onTap;
//   const RegisterPage1({super.key, required this.onTap});

//   @override
//   State<RegisterPage1> createState() => _RegisterPage1State();
// }

// class _RegisterPage1State extends State<RegisterPage1> {
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//   final confirmPasswordController = TextEditingController();

//   void signUserUp() async {
//     if (usernameController.text.trim().isEmpty &&
//         passwordController.text.trim().isEmpty &&
//         confirmPasswordController.text.trim().isEmpty) {
//       _showErrorDialog("Email, Password, and Confirm Password cannot be empty.");
//       return;
//     } else if (usernameController.text.trim().isEmpty) {
//       _showErrorDialog("Please enter your email.");
//       return;
//     } else if (passwordController.text.trim().isEmpty) {
//       _showErrorDialog("Please enter your password.");
//       return;
//     } else if (confirmPasswordController.text.trim().isEmpty) {
//       _showErrorDialog("Please confirm your password.");
//       return;
//     }

//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) {
//         return const Center(
//           child: CircularProgressIndicator(
//             backgroundColor: Color(0xFF20B2AA),
//             valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF5F5DC)),
//           ),
//         );
//       },
//     );

//     try {
//       if (passwordController.text == confirmPasswordController.text) {
//         await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: usernameController.text.trim(),
//           password: passwordController.text.trim(),
//         );
//       } else {
//         if (Navigator.canPop(context)) Navigator.pop(context);
//         _showErrorDialog('Passwords do not match.');
//         return;
//       }

//       if (Navigator.canPop(context)) Navigator.pop(context);
//     } on FirebaseAuthException catch (e) {
//       if (Navigator.canPop(context)) Navigator.pop(context);

//       if (e.code == 'email-already-in-use') {
//         _showErrorDialog('This email is already registered.');
//       } else if (e.code == 'invalid-email') {
//         _showErrorDialog('Invalid email format.');
//       } else if (e.code == 'weak-password') {
//         _showErrorDialog('Password is too weak. It must be at least 6 characters.');
//       } else {
//         _showErrorDialog('Account creation failed: ${e.message}');
//       }
//     }
//   }


//   // void signUserUp() async {
//   //   showDialog(
//   //     context: context,
//   //     builder: (context) {
//   //       return const Center(
//   //         child: CircularProgressIndicator(
//   //           backgroundColor: Color(0xFF20B2AA),
//   //           valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF5F5DC)),
//   //         ),
//   //       );
//   //     },
//   //   );
//   //
//   //   try {
//   //     if (passwordController.text == confirmPasswordController.text) {
//   //       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//   //         email: usernameController.text,
//   //         password: passwordController.text,
//   //       );
//   //     } else {
//   //       _showErrorDialog('Passwords do not match.');
//   //       return;
//   //     }
//   //
//   //     if (Navigator.canPop(context)) Navigator.pop(context);
//   //   }
//   //   on FirebaseAuthException catch (e) {
//   //
//   //     if (Navigator.canPop(context)) Navigator.pop(context);
//   //
//   //     if (e.code == 'email-already-in-use') {
//   //       _showErrorDialog('This email is already registered.');
//   //     } else if (e.code == 'invalid-email') {
//   //       _showErrorDialog('Invalid email format.');
//   //     } else if (e.code == 'weak-password') {
//   //       _showErrorDialog('Password is too weak. It must be at least 6 characters.');
//   //     } else {
//   //       _showErrorDialog('Account creation failed: ${e.message}');
//   //     }
//   //   }
//   // }

//   void _showErrorDialog(String message) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           backgroundColor: Color(0xFF20B2AA),
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(15),
//           ),
//           title: Text(
//             "Login Failed",
//             style: GoogleFonts.poppins(
//               fontSize: 22,
//               color: const Color(0xFFF5F5DC),
//             ),
//           ),
//           content: Text(
//             message,
//             style: GoogleFonts.poppins( // 🔹 Google Font for content
//               fontSize: 16,
//               color: Color(0xFFF5F5DC),
//             ),
//           ),
//           actions: [
//             TextButton(
//               style: TextButton.styleFrom(
//                 foregroundColor: Color(0xFF20B2AA), //teal
//                 backgroundColor: Color(0xFFF5F5DC),  //beige
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//               ),
//               onPressed: () => Navigator.pop(context),
//               child: Text(
//                 "OK",
//                 style: GoogleFonts.poppins( // 🔹 Google Font for button
//                   fontSize: 16,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   //   try {
//   //     await FirebaseAuth.instance.signInWithEmailAndPassword(
//   //       email: usernameController.text,
//   //       password: passwordController.text,
//   //     );
//   //     Navigator.pop(context);
//   //   } on FirebaseAuthException catch (e) {
//   //     Navigator.pop(context);
//   //     if (e.code == 'user-not-found') {
//   //       wrongEmailMessage();
//   //     } else if (e.code == 'wrong-password') {
//   //       wrongPasswordMessage();
//   //     }
//   //   }
//   // }
//   //
//   // void wrongEmailMessage() {
//   //   showDialog(context: context, builder: (context) {
//   //     return const AlertDialog(title: Text('Incorrect Email'),
//   //     );
//   //   },
//   //   );
//   // }
//   //
//   // void wrongPasswordMessage() {
//   //   showDialog(context: context, builder: (context) {
//   //     return const AlertDialog(title: Text('Inorrect Password'),
//   //     );
//   //   },
//   //   );
//   // }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF5F5DC),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(height: 50),
//                 Image.asset(
//                   'assets/images/applogo1.png',
//                   height: 175,
//                   width: 175,
//                 ),
//                 MyTextField(
//                   controller: usernameController,
//                   hintText: 'Username',
//                   obscureText: false,
//                 ),
//                 const SizedBox(height: 10),
//                 MyTextField(
//                   controller: passwordController,
//                   hintText: 'Password',
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 10),
//                 MyTextField(
//                   controller: confirmPasswordController,
//                   hintText: 'Confirm Password',
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 20),
//                 MyButton(
//                   text: 'Sign Up',
//                   onTap: signUserUp,
//                 ),
//                 const SizedBox(height: 25),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                   child: Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           thickness: 0.5,
//                           color: Colors.grey[400],
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 10.0),
//                         child: Text(
//                           'Or continue with',
//                           style: GoogleFonts.poppins(color: Colors.grey[700]),
//                         ),
//                       ),
//                       Expanded(
//                         child: Divider(
//                           thickness: 0.5,
//                           color: Colors.grey[400],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 25),

//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       SquareTile(
//                           onTap: () => FirebaseAuthServices().signInWithGoogle(),
//                           imagePath: 'assets/images/googlelog.png'),

//                     ],
//                   ),
//                 ),

//                 const SizedBox(height: 25),

//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Already have an account?',
//                       style: TextStyle(color: Colors.grey[700]),
//                     ),
//                     const SizedBox(width: 4),
//                     GestureDetector(
//                       onTap: widget.onTap,
//                       child: Text(
//                         'Login now',
//                         style: GoogleFonts.poppins(
//                           color: Colors.blue,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:placeme/authentication/google_authentication.dart';
import 'package:placeme/pages1/sign_in.dart';
import 'package:placeme/pages1/text_field.dart';
import 'package:google_fonts/google_fonts.dart';
import 'logo.dart';

class RegisterPage1 extends StatefulWidget {
  final Function()? onTap;
  const RegisterPage1({super.key, required this.onTap});

  @override
  State<RegisterPage1> createState() => _RegisterPage1State();
}

class _RegisterPage1State extends State<RegisterPage1> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void signUserUp() async {
    if (usernameController.text.trim().isEmpty &&
        passwordController.text.trim().isEmpty &&
        confirmPasswordController.text.trim().isEmpty) {
      _showErrorDialog("Email, Password, and Confirm Password cannot be empty.");
      return;
    } else if (usernameController.text.trim().isEmpty) {
      _showErrorDialog("Please enter your email.");
      return;
    } else if (passwordController.text.trim().isEmpty) {
      _showErrorDialog("Please enter your password.");
      return;
    } else if (confirmPasswordController.text.trim().isEmpty) {
      _showErrorDialog("Please confirm your password.");
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(
            backgroundColor: Color(0xFF20B2AA),
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFF5F5DC)),
          ),
        );
      },
    );

    try {
      if (passwordController.text == confirmPasswordController.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: usernameController.text.trim(),
          password: passwordController.text.trim(),
        );
      } else {
        if (mounted && Navigator.canPop(context)) Navigator.pop(context);
        if (mounted) _showErrorDialog('Passwords do not match.');
        return;
      }

      if (mounted && Navigator.canPop(context)) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (mounted && Navigator.canPop(context)) Navigator.pop(context);

      if (e.code == 'email-already-in-use') {
        if (mounted) _showErrorDialog('This email is already registered.');
      } else if (e.code == 'invalid-email') {
        if (mounted) _showErrorDialog('Invalid email format.');
      } else if (e.code == 'weak-password') {
        if (mounted) _showErrorDialog('Password is too weak. It must be at least 6 characters.');
      } else {
        if (mounted) _showErrorDialog('Account creation failed: ${e.message}');
      }
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color(0xFF20B2AA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Text(
            "Registration Failed",
            style: GoogleFonts.poppins(
              fontSize: 22,
              color: const Color(0xFFF5F5DC),
            ),
          ),
          content: Text(
            message,
            style: GoogleFonts.poppins(
              fontSize: 16,
              color: Color(0xFFF5F5DC),
            ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Color(0xFF20B2AA),
                backgroundColor: Color(0xFFF5F5DC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              onPressed: () {
                if (mounted) Navigator.pop(context);
              },
              child: Text(
                "OK",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5DC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Image.asset(
                  'assets/images/applogo1.png',
                  height: 175,
                  width: 175,
                ),
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: 'Confirm Password',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                MyButton(
                  text: 'Sign Up',
                  onTap: signUserUp,
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: GoogleFonts.poppins(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SquareTile(
                          onTap: () => FirebaseAuthServices().signInWithGoogle(),
                          imagePath: 'assets/images/googlelog.png'),

                    ],
                  ),
                ),

                const SizedBox(height: 25),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        'Login now',
                        style: GoogleFonts.poppins(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}