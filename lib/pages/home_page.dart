import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inclusive_hue/pages/camera_tool_page.dart';
import 'package:inclusive_hue/pages/notification_page.dart';
import 'package:inclusive_hue/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    Center(child:Text('Home Page')),
    CameraToolPage(),
    NotificationPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: GNav(
            backgroundColor:Theme.of(context).colorScheme.surface,
            activeColor: Theme.of(context).colorScheme.inversePrimary,
            color: Theme.of(context).colorScheme.tertiary,
            tabBackgroundColor: Theme.of(context).colorScheme.secondary,
            padding: const EdgeInsets.all(15),
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.camera_alt,
                text: 'Camera',
              ),
              GButton(
                icon: Icons.notifications,
                text: 'Notification',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedIndex,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
