import 'package:flutter/material.dart';

// สร้างหน้า ThankPage สำหรับการแสดงหลังจากการชำระเงิน
class ThankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thank You"),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
        ),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.check_circle_outline, size: 120, color: Colors.green),
            SizedBox(height: 20),
            Text(
              'Thank you for your order!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// สร้างหน้า PaymentPage ที่มีการใช้งานการชำระเงินและนำทางไปยัง ThankPage
class PaymentPage extends StatelessWidget {
  final Map<String, dynamic> productDetails;

  PaymentPage({required this.productDetails});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('การจ่ายเงิน'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // แสดงรูปภาพ
                Image.asset(
                  productDetails['imagePath'],
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 20),
                Text(
                  'รายละเอียดการจ่ายเงิน',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  'ชื่อสินค้า: ${productDetails['name']}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'ราคา: ${productDetails['price']}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'จำนวน: ${productDetails['quantity']}',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    child: Text('ดำเนินการจ่ายเงิน'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ThankPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
