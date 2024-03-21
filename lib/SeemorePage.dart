import 'package:flutter/material.dart';

class SeeMorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('See More', style: TextStyle(color: Colors.red)),
        backgroundColor: Colors.white,
      ),
      body: Center(
        // Replace this with your actual list or content
        child: Text('More content here', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
