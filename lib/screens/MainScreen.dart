import 'package:flutter/material.dart';
import 'package:learnsphere/screens/HomeScreen.dart';
import 'package:learnsphere/widgets/colors.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  int selectedIndex = 0;
  final List<Widget> _pages = [
    homepage(),
    homepage(),
    homepage(),
    homepage(),
    homepage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            label: 'Task',
            icon: Icon(Icons.task_alt_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Calender',
            icon: Icon(Icons.calendar_month_rounded),
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
