import 'package:flutter/material.dart';


void main() {
  runApp(const MyBottomNavApp());
}


class MyBottomNavApp extends StatelessWidget {
  const MyBottomNavApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: const MainScreen(),
    );
  }
}


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentTabIndex = 0;

 
  final List<Widget> _tabs = [
    const HomeTab(),
    const SearchTab(),
    const ProfileTab(),
  ];

 
  void _handleTabTap(int index) {
    setState(() {
      _currentTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300), 
        child: _tabs[_currentTabIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        onTap: _handleTabTap,
        selectedItemColor: Colors.teal, 
        unselectedItemColor: Colors.grey, 
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}


class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Home Tab',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black87, 
            ),
          ),
          const SizedBox(height: 20),
          Image.asset(
            'assets/images/sample.avif', 
            width: 150,
            height: 150,
          ),
        ],
      ),
    );
  }
}


class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Search Tab',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black87, 
            ),
          ),
          SizedBox(height: 20),
          Icon(
            Icons.search,
            size: 100,
            color: Colors.cyan, 
          ),
        ],
      ),
    );
  }
}


class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Profile Tab',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black87, 
            ),
          ),
          SizedBox(height: 20),
          Icon(
            Icons.person,
            size: 100,
            color: Colors.teal, 
          ),
        ],
      ),
    );
  }
}