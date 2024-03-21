import 'package:flutter/material.dart';
import 'RegisterPage.dart'; // ตรวจสอบให้แน่ใจว่าเส้นทางนี้ถูกต้อง
import 'ProductPage.dart'; // สมมติว่าคุณได้สร้างหน้า ProductPage แล้ว

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: Colors.red, // เพิ่มเติมเพื่อให้สอดคล้องกับสีหลักของคุณ
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 50),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.red.shade50,
                    hintText: 'Username or Email',
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
                    // เพิ่มตรรกะการล็อกอินของคุณที่นี่
                    // หลังจากล็อกอินสำเร็จ ให้นำทางไปยัง ProductPage
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProductPage()),
                    );
                  },
                  color: Colors.red,
                  child: Text('Login', style: TextStyle(color: Colors.white)),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Divider(color: Colors.black),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text('OR'),
                    ),
                    Expanded(
                      child: Divider(color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    // Navigate to RegisterPage when user taps 'Register'
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage()),
                    );
                  },
                  color: Colors.red,
                  child: Text('Register', style: TextStyle(color: Colors.white)),
                  padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
