import 'package:flutter/material.dart';
import 'LoginPage.dart'; // Import LoginPage

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            SizedBox(height: 20), // เพิ่มพื้นที่ระหว่างด้านบนของหน้าจอและรูปโปรไฟล์
            CircleAvatar(
              radius: 60, // ปรับขนาดของรูปโปรไฟล์ของคุณ
              backgroundImage: AssetImage('assets/profile_picture.png'), // ใส่รูปโปรไฟล์ของคุณในโฟลเดอร์ assets
            ),
            SizedBox(height: 20), // ระยะห่างระหว่างรูปภาพและชื่อ
            Text(
              'Sehun',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '+1 11229382748',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 30), // ระยะห่างระหว่างหมายเลขโทรศัพท์และเมนู
            MenuItem(icon: Icons.person, text: 'My Profile'),
            MenuItem(icon: Icons.settings, text: 'Settings'),
            MenuItem(icon: Icons.shopping_bag, text: 'My Purchase'),
            MenuItem(icon: Icons.info_outline, text: 'About Us'),
            MenuItem(icon: Icons.mail_outline, text: 'Contact Us'),
            Spacer(), // ดันปุ่มลงชื่อออกไปยังด้านล่างของหน้าจอ
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()), // Navigate to LoginPage
                );
              },
              child: Text('Sign Out'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // สีพื้นหลัง
                onPrimary: Colors.white, // สีข้อความ
              ),
            ),
            SizedBox(height: 20), // เพิ่มพื้นที่ที่ด้านล่าง
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Profile'), // ใส่ชื่อหน้าต่าง ๆ ที่ต้องการ
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // ใส่ไอคอนย้อนกลับ
          onPressed: () {
            Navigator.pop(context); // ใช้ Navigator.pop() เพื่อย้อนกลับไปยังหน้าก่อนหน้า
          },
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const MenuItem({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {
        // เพิ่มการนำทางหรือฟังก์ชันที่นี่
      },
    );
  }
}
