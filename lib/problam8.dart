import 'package:flutter/material.dart';

void main() {
  runApp(const NavigationDrawerApp());
}

class NavigationDrawerApp extends StatelessWidget {
  const NavigationDrawerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home Screen',
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xFFB2E8F5), 
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF2A9D8F), 
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            _buildDrawerItem(
              icon: Icons.image,
              text: 'Image Grid',
              onTap: () {
                _navigateTo(context, const ImageGridScreen());
              },
            ),
            _buildDrawerItem(
              icon: Icons.settings,
              text: 'Settings',
              onTap: () {
                _navigateTo(context, const SettingsScreen());
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text('Welcome to the Home Screen!'),
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: onTap,
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}

class ImageGridScreen extends StatelessWidget {
  const ImageGridScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Grid',
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xFF4A90E2), // Changed from Colors.blue
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return _buildImageItem();
          },
        ),
      ),
    );
  }

  Widget _buildImageItem() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          'https://media.istockphoto.com/id/1436977595/photo/contemporary-art-collage-conceptual-image-young-woman-feeling-sadness-concept-of-retro-style.jpg?s=2048x2048&w=is&k=20&c=_CijUOQcPep5AJ_R2LKlvf9I73bvYIhVJiQh2PxUNgI=',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color(0xFFE07A5F), // Changed from 0xFFD043DF
      ),
      body: const Center(
        child: Text('Settings Page'),
      ),
    );
  }
}