import 'package:flutter/material.dart';
import 'package:ze04/LoginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromARGB(255, 252, 50, 71), // Adjust the background color as needed
        child: Center( // Use Center to center the content vertically and horizontally
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Center the column's content vertically
            children: <Widget>[
              Image.asset('assets/images/Welcome.jpg', width: 500), // Replace with your image path and adjust width as needed
              SizedBox(height: 20), // Provide some space between the image and the text
              Text(
                "Let's enjoy on POP Mart Shop",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20), // Provide some space between the text and the button
              ElevatedButton(
                child: Text('Let’s Start'),
                onPressed: () {
                  Navigator.push( // Add this line
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()), // Change this to your login page
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 235, 100, 91), // Button color
                  textStyle: TextStyle(fontSize: 20), // Button text style
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
