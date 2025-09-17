import 'package:flutter/material.dart';
import 'explore_screen.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  int selectedIndex = 0;
  late final List<Widget> page;

  @override
  void initState() {
    page = [
      const ExploreScreen(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFF5F5DC),
        elevation: 5,
        iconSize: 32,
        selectedItemColor: Color(0xFF20B2AA),
        unselectedItemColor: Colors.blue,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.network(
              "https://cdn1.iconfinder.com/data/icons/jumpicon-basic-ui-glyph-1/32/-_Magnifier-Search-Zoom--256.png",
              height: 30,
              color: selectedIndex == 0 ? Color(0xFF20B2AA) : Color(0xFFF5F5DC),
            ),
            label: "explore ka muna",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite_border,
              color: selectedIndex == 1 ? Color(0xFF20B2AA) : Color(0xFFF5F5DC),
            ),
            label: "mga paborito",
          ),
          BottomNavigationBarItem(
            icon: Image.network(
              "https://cdn1.iconfinder.com/data/icons/jumpicon-basic-ui-glyph-1/32/-_Home-House--256.png",
              height: 30,
              color: selectedIndex == 2 ? Color(0xFF20B2AA) : Color(0xFFF5F5DC),
            ),
            label: "mga bahay",
          ),
          BottomNavigationBarItem(
            icon: Image.network(
              "https://cdn4.iconfinder.com/data/icons/epic-outlines/30/message_2-64.png",
              height: 30,
              color: selectedIndex == 3 ? Color(0xFF20B2AA) : Color(0xFFF5F5DC),
            ),
            label: "makipag usap ",
          ),
          BottomNavigationBarItem(
            icon: Image.network(
              "https://cdn0.iconfinder.com/data/icons/cryptocurrency-137/128/1_profile_user_avatar_account_person-132-512.png",
              height: 30,
              color: selectedIndex == 4 ? Color(0xFF20B2AA) : Color(0xFFF5F5DC),
            ),
            label: "imong profile",
          ),
        ],
      ),
      body: page[selectedIndex],
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import '../model/category.dart';
// import '../model/place_model.dart';
// import 'explore_screen.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: AppMainScreen(),
//     );
//   }
// }
//
// class AppMainScreen extends StatefulWidget {
//   const AppMainScreen({super.key});
//
//   @override
//   State<AppMainScreen> createState() => _AppMainScreenState();
// }
//
// class _AppMainScreenState extends State<AppMainScreen> {
//   int selectedIndex = 0;
//   late final List<Widget> page;
//
//   @override
//   void initState() {
//     super.initState();
//     page = [
//       const ExploreScreen(), // Tab 0
//       Scaffold(
//         body: Center(
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => const UploadDataToFirebase(),
//                 ),
//               );
//             },
//             child: const Text('Upload Data'),
//           ),
//         ),
//       ), // Tab 1
//       const Scaffold(), // Tab 2
//       const Scaffold(), // Tab 3
//       const Scaffold(), // Tab 4
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white24,
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.white,
//         elevation: 5,
//         iconSize: 32,
//         selectedItemColor: Colors.red,
//         unselectedItemColor: Colors.blue,
//         selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
//         unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
//         type: BottomNavigationBarType.fixed,
//         currentIndex: selectedIndex,
//         onTap: (index) {
//           setState(() {
//             selectedIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             icon: Image.network(
//               "https://cdn1.iconfinder.com/data/icons/jumpicon-basic-ui-glyph-1/32/-_Magnifier-Search-Zoom--256.png",
//               height: 30,
//               color: selectedIndex == 0 ? Colors.red : Colors.amber,
//             ),
//             label: "explore ka muna",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.upload_file,
//               color: selectedIndex == 1 ? Colors.red : Colors.amber,
//             ),
//             label: "upload data",
//           ),
//           BottomNavigationBarItem(
//             icon: Image.network(
//               "https://cdn1.iconfinder.com/data/icons/jumpicon-basic-ui-glyph-1/32/-_Home-House--256.png",
//               height: 30,
//               color: selectedIndex == 2 ? Colors.red : Colors.amber,
//             ),
//             label: "mga bahay",
//           ),
//           BottomNavigationBarItem(
//             icon: Image.network(
//               "https://cdn4.iconfinder.com/data/icons/epic-outlines/30/message_2-64.png",
//               height: 30,
//               color: selectedIndex == 3 ? Colors.red : Colors.amber,
//             ),
//             label: "makipag usap",
//           ),
//           BottomNavigationBarItem(
//             icon: Image.network(
//               "https://cdn0.iconfinder.com/data/icons/cryptocurrency-137/128/1_profile_user_avatar_account_person-132-512.png",
//               height: 30,
//               color: selectedIndex == 4 ? Colors.red : Colors.amber,
//             ),
//             label: "imong profile",
//           ),
//         ],
//       ),
//       body: page[selectedIndex],
//     );
//   }
// }
//
// class UploadDataToFirebase extends StatelessWidget {
//   const UploadDataToFirebase({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Upload Data"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             savePlacesToFirebase(); // Your Firebase upload function
//           },
//           child: const Text("Upload Data"),
//         ),
//       ),
//     );
//   }
// }
