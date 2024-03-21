import 'package:flutter/material.dart';
import 'package:ze04/PaymentPage.dart';

void main() => runApp(MaterialApp(
  home: ProductDetailPage(
    name: 'CHIBI MARUKO',
    imagePath: 'assets/images/Dimoo.png',
    price: '380',
  ),
));

class ProductDetailPage extends StatefulWidget {
  final String name;
  final String imagePath;
  final String price;

  ProductDetailPage({required this.name, required this.imagePath, required this.price});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1; // จำนวนสินค้า

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildProductDetail(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back, color: Colors.red),
        onPressed: () => Navigator.of(context).pop(),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
    );
  }

  Widget buildProductDetail() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildProductImage(),
          buildProductInfo(),
        ],
      ),
    );
  }

  Widget buildProductImage() => Center(child: Image.asset(widget.imagePath, height: 300));

  Widget buildProductInfo() => Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('${widget.price}', style: TextStyle(fontSize: 20, color: Colors.red)),
            SizedBox(height: 16),
            Text('รายละเอียด', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            buildProductDetailsText(),
            SizedBox(height: 16),
            buildQuantityAdjustment(),
            SizedBox(height: 16),
            buildActionButtons(),
          ],
        ),
      );

  Widget buildProductDetailsText() => Text(
        'ทุกรูปแบบ\nยี่ห้อ: POP MART\nวัสดุ: PVC/ABS\nขนาด: สูงประมาณ 5.6-8.1CM\nชุดเต็มประกอบด้วย 9 กล่องสุ่ม',
        style: TextStyle(fontSize: 16),
      );

  Widget buildQuantityAdjustment() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.remove, color: Colors.red),
            onPressed: () {
              setState(() {
                if (quantity > 1) {
                  quantity--;
                }
              });
            },
          ),
          Text('$quantity', style: TextStyle(fontSize: 20)),
          IconButton(
            icon: Icon(Icons.add, color: Colors.red),
            onPressed: () {
              setState(() {
                quantity++;
              });
            },
          ),
        ],
      );

  Widget buildActionButtons() => Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: addToCart,
              child: Text('เพิ่มลงในตะกร้า', style: TextStyle(color: Colors.white)),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.red),
              onPressed: buyImmediately,
              child: Text('ซื้อทันที', style: TextStyle(color: Colors.white)),
            ),
          ),
        ],
      );

  void addToCart() {
    Map<String, dynamic> cartItem = {
      'name': widget.name,
      'imagePath': widget.imagePath,
      'price': widget.price,
      'quantity': quantity,
    };

    Navigator.pop(context, cartItem);
  }

  void buyImmediately() {
    Map<String, dynamic> productDetails = {
      'name': widget.name,
      'imagePath': widget.imagePath,
      'price': widget.price,
      'quantity': quantity,
    };

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PaymentPage(productDetails: productDetails),
      ),
    );
  }
}
