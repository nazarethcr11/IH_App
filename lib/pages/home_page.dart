import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:inclusive_hue/components/my_slider.dart';
import 'package:inclusive_hue/components/my_toggle_button.dart';
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
    HomePageInside(),
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
            tabs: const [
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

class HomePageInside extends StatelessWidget {
  const HomePageInside({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyToggleButton(
            leftLabel: 'Apagado',
            rightLabel: 'Encendido',
            isToggled: false,
          ),
          SizedBox(height: 20),
          MySlider(initialValue: 21, title: 'Ajuste de color'),
          SizedBox(height: 20),
          MySlider(initialValue: 50, title: 'Intensidad de luz'),
          //preview image
          SizedBox(height: 20),
          // agregar lib/images/default/preview.jpg
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: const DecorationImage(
                image: AssetImage('lib/images/default/preview.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 10),
          //icon and text preview image
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.remove_red_eye_outlined, color: Theme.of(context).colorScheme.primary),
              SizedBox(width: 5),
              Text('Vista previa'),
            ],
          ),

        ],
      ),
    );
  }
}

