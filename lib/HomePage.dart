import 'package:flutter/material.dart';
import 'package:ze04/ProductDetailPage.dart';
import 'package:ze04/MyPurchases.dart';  // ตรวจสอบว่าคุณได้นำเข้า MyPurchases.dart ไว้

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> purchasedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Mypurchases(purchasedItems: purchasedItems),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Product Detail'),
          onPressed: () {
            navigateToProductDetail(context);
          },
        ),
      ),
    );
  }

  Future<void> navigateToProductDetail(BuildContext context) async {
    final Map<String, dynamic>? cartItem = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(
          name: 'CHIBI MARUKO',
          imagePath: 'assets/images/Dimoo.png',
          price: '380',
        ),
      ),
    );

    if (cartItem != null) {
      setState(() {
        purchasedItems.add(cartItem);
      });
      // แสดงผลการเพิ่มสินค้า สามารถใช้ Flutter Snackbar หรือ dialog เพื่อแจ้งเตือนผู้ใช้
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Added to cart: ${cartItem['name']}'),
        ),
      );
    }
  }
}

