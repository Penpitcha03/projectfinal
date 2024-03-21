import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Register',
                  style: TextStyle(fontSize: 30, color: Colors.red, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.red.shade50,
                    hintText: 'Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.red.shade50,
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.red.shade50,
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                MaterialButton(
                  onPressed: () {
                    // Navigate to the login page after sign up
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  color: Colors.red,
                  child: Text('Sign up', style: TextStyle(color: Colors.white)),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    // Navigate back to the login page if the user already has an account
                    Navigator.pop(context);
                  },
                  child: Text('Already have an account? Sign in', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



