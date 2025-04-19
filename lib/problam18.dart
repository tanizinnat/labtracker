import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ProfilePage(),
    );
  }
}


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  
  File? _selectedImage;
  
  final ImagePicker _imagePicker = ImagePicker();

  
  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? pickedImage = await _imagePicker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedImage != null) {
        setState(() {
          _selectedImage = File(pickedImage.path);
        });
      }
    } catch (e) {
      
      print('Error picking image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            GestureDetector(
              onTap: _pickImageFromGallery,
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.blueGrey[200], 
                backgroundImage:
                    _selectedImage != null ? FileImage(_selectedImage!) : null,
                child: _selectedImage == null
                    ? const Icon(
                        Icons.add_a_photo,
                        size: 40,
                        color: Colors.white,
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 20),
            
            const Text(
              'Tap the avatar to pick a new image',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}