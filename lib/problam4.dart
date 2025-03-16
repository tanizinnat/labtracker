import 'package:flutter/material.dart';

void main() {
  runApp(StyledTextApp());
}

class StyledTextApp extends StatelessWidget {
  StyledTextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TextStyleScreen(),
    );
  }
}

class TextStyleScreen extends StatelessWidget {
  TextStyleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Styled Text AppBar')),
        backgroundColor: Colors.teal, 
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Large Bold Text',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange, 
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Medium Italic Text',
              style: TextStyle(
                fontSize: 22,
                fontStyle: FontStyle.italic,
                color: Colors.tealAccent, 
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Underlined Blue Text',
              style: TextStyle(
                fontSize: 20,
                decoration: TextDecoration.underline,
                color: Colors.indigo, 
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Left-aligned Text',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.amber, 
                  ),
                ),
                Text(
                  'Right-aligned Text',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.deepPurple, 
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}