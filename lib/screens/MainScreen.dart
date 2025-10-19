import 'package:flutter/material.dart';
import 'package:learnsphere/screens/HomeScreen.dart';
import 'package:learnsphere/screens/ProfileScreen.dart';
import 'package:learnsphere/screens/ProgramListScreen.dart';
import 'package:learnsphere/widgets/colors.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int selectedIndex = 0;
  final List<Widget> _pages = [
    Homescreen(),
    ProgramlistScreen(),
    Homescreen(),
    Homescreen(),
    Profilescreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF9FAFB),
      body: _pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: AppColors.iconColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(label: 'Home', icon: Icon(Icons.home)),
          BottomNavigationBarItem(
            label: 'Programs',
            icon: Icon(Icons.menu_book),
          ),
          BottomNavigationBarItem(
            label: 'My Learning',
            icon: Icon(Icons.my_location_sharp),
          ),
          BottomNavigationBarItem(
            label: 'Task',
            icon: Icon(Icons.task_alt_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person_pin),
          ),
        ],
      ),
    );
  }
}
