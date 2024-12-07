import 'package:flutter/material.dart';
import 'package:taskapp/views/dashboard_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const Center(child: Text('Screen 2')), // Replace with actual screens
    const Center(child: Text('Screen 3')), // Replace with actual screens
    const Center(child: Text('Screen 4')), // Replace with actual screens
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x4D52BF90),
              blurRadius: 10,
              spreadRadius: 3,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          child: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF52BF90),
            unselectedItemColor: Colors.grey,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Icon(
                    Icons.home,
                    size: 35,
                  ),
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Icon(
                    Icons.forest,
                    size: 35,
                  ),
                ),
                label: 'Projects',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Icon(
                    Icons.wallet,
                    size: 35,
                  ),
                ),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Icon(
                    Icons.track_changes,
                    size: 35,
                  ),
                ),
                label: 'Target',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
