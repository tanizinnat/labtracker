import 'package:flutter/material.dart';

void main() {
  runApp(const BottomNavApp());
}


class BottomNavApp extends StatelessWidget {
  const BottomNavApp({super.key});

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
  int _currentIndex = 0;

  
  final List<Widget> _tabs = [
    const HomeTab(),
    const SearchTab(),
    const ProfileTab(),
  ];

  
  void _handleTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _tabs[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _handleTap,
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
            'Home',
            style: TextStyle(
              fontSize: 24,
              color: Colors.black87, 
            ),
          ),
          const SizedBox(height: 20),
          Image.network(
            'https://plus.unsplash.com/premium_photo-1676923901465-14903a3fcc68?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
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
            'Search',
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
            'Profile',
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