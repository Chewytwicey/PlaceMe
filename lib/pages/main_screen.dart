import 'package:flutter/material.dart';
import 'package:placeme/pages/favorites.dart';
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
      const Favorites(),
      const Scaffold(body: Center(child: Text('Create'))),
      const Scaffold(body: Center(child: Text('Messages'))),
      const Scaffold(body: Center(child: Text('Profile'))),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5DC),
      body: Stack(
        children: [
          page[selectedIndex],
          
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: Container(
              height: 70,
              decoration: BoxDecoration(
                color: Color(0xFF20B2AA),
                borderRadius: BorderRadius.circular(35),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(
                    index: 0,
                    icon: Image.network(
                      "https://cdn1.iconfinder.com/data/icons/jumpicon-basic-ui-glyph-1/32/-_Magnifier-Search-Zoom--256.png",
                      height: 20, // Reduced size
                      color: selectedIndex == 0 ? Color(0xFFF5F5DC) : Color(0xFF1A9B94),
                    ),
                    label: "Explore",
                  ),
                  _buildNavItem(
                    index: 1,
                    icon: Icon(
                      Icons.favorite_border,
                      size: 20, // Reduced size
                      color: selectedIndex == 1 ? Color(0xFFF5F5DC) : Color(0xFF1A9B94),
                    ),
                    label: "Favorites",
                  ),
                  _buildNavItem(
                    index: 2, // Fixed index
                    icon: Image.network(
                      "https://cdn2.iconfinder.com/data/icons/social-productivity-line-art-2/128/add-256.png",
                      height: 20, // Reduced size
                      color: selectedIndex == 2 ? Color(0xFFF5F5DC) : Color(0xFF1A9B94),
                    ),
                    label: "Create",
                  ),
                  _buildNavItem(
                    index: 3, // Fixed index
                    icon: Image.network(
                      "https://cdn4.iconfinder.com/data/icons/epic-outlines/30/message_2-64.png",
                      height: 20, // Reduced size
                      color: selectedIndex == 3 ? Color(0xFFF5F5DC) : Color(0xFF1A9B94),
                    ),
                    label: "Messages",
                  ),
                  _buildNavItem(
                    index: 4, // Fixed index
                    icon: Image.network(
                      "https://cdn0.iconfinder.com/data/icons/cryptocurrency-137/128/1_profile_user_avatar_account_person-132-512.png",
                      height: 20, // Reduced size
                      color: selectedIndex == 4 ? Color(0xFFF5F5DC) : Color(0xFF1A9B94),
                    ),
                    label: "Profile",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required Widget icon,
    required String label,
  }) {
    final isSelected = selectedIndex == index;
    
    return Expanded( // Added Expanded to distribute space evenly
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: isSelected ? 8 : 6, // Reduced padding
            vertical: 8,
          ),
          margin: EdgeInsets.symmetric(horizontal: 2), // Added margin
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF1A9B94) : Colors.transparent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              icon,
              SizedBox(height: 2), // Reduced spacing
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? Color(0xFFF5F5DC) : Color(0xFF1A9B94),
                  fontSize: 9, // Reduced font size
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis, // Handle text overflow
              ),
            ],
          ),
        ),
      ),
    );
  }
}