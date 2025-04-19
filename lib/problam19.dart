import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';


void main() {
  runApp(const SettingsApp());
}


class SettingsApp extends StatelessWidget {
  const SettingsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system, 
      theme: ThemeData.light().copyWith(
        primaryColor: Colors.teal, 
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: Colors.teal, 
      ),
      home: const ProfileScreen(),
    );
  }
}


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  File? _selectedImage; 
  final ImagePicker _imagePicker = ImagePicker(); 
  late AnimationController _animationController; 
  late Animation<Offset> _slideAnimation; 
  bool _isDrawerOpen = false; 
  @override
  void initState() {
    super.initState();
    r
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    
    _slideAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), 
      end: Offset.zero, 
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    
    _animationController.dispose();
    super.dispose();
  }

  
  Future<void> _pickImageFromGallery() async {
    try {
      
      final photosPermission = await Permission.photos.request();
      final mediaImagesPermission = await Permission.mediaLibrary.request();

      if (photosPermission.isGranted || mediaImagesPermission.isGranted) {
        final pickedFile = await _imagePicker.pickImage(
          source: ImageSource.gallery,
        );
        if (pickedFile != null) {
          setState(() {
            _selectedImage = File(pickedFile.path);
          });
        }
      } else {
        
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Gallery access permission denied.'),
          ),
        );
      }
    } catch (e) {
     
      print('Error picking image: $e');
    }
  }

  
  void _toggleDrawer() {
    setState(() {
      _isDrawerOpen = !_isDrawerOpen;
     
      _isDrawerOpen ? _animationController.forward() : _animationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Page'),
        centerTitle: true,
        backgroundColor: Colors.teal, 
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                
                GestureDetector(
                  onTap: _pickImageFromGallery,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.teal.shade100, 
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!)
                        : null,
                    child: _selectedImage == null
                        ? const Icon(
                            Icons.camera_alt,
                            size: 40,
                            color: Colors.teal, 
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 20),
                // Button to pick image
                ElevatedButton(
                  onPressed: _pickImageFromGallery,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal, 
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'Choose Image',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          
          SlideTransition(
            position: _slideAnimation,
            child: SafeArea(
              child: Container(
                width: 250,
                color: Colors.teal.shade100, 
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 40),
                    Text(
                      'Home',
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Settings',
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Logout',
                      style: TextStyle(fontSize: 20, color: Colors.black87),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.menu, color: Colors.black87),
                onPressed: _toggleDrawer,
              ),
            ),
          ),
        ],
      ),
    );
  }
}