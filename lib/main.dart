import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';
import 'ProductPage.dart'; // ตรวจสอบว่าคุณได้สร้างหน้า ProductPage และอิมพอร์ตมาอย่างถูกต้อง

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RegisterPage(), // หรือ ProductPage ตามที่คุณต้องการเป็นหน้าแรก
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/productPage': (context) => ProductPage(), // เพิ่ม route สำหรับ ProductPage
        // เพิ่ม routes อื่นๆ ตามที่จำเป็น
      },
    );
  }
}

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Products"),
      ),
      // รายละเอียดของหน้า ProductPage ตามที่คุณออกแบบ
    );
  }
}
