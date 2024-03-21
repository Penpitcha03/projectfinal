import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'RegisterPage.dart';
import 'ProductDetailPage.dart';
import 'ProfilePage.dart';
import 'MyPurchases.dart';

void main() => runApp(ProductApp());

class ProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProductPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/ProductPage': (context) => ProductPage(),
        '/ProfilePage': (context) => ProfilePage(), // เพิ่มเส้นทาง ProfilePage
        '/ThankPage': (context) => ThankPage(),
        // เพิ่มเส้นทางอื่นๆ ตามที่จำเป็น
      },
    );
  }
}

class ThankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Thank You"),
        leading: IconButton(
          icon: Icon(Icons.home),
          onPressed: () =>
              Navigator.popUntil(context, ModalRoute.withName('/productPage')),
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
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Good Morning Sehun', style: TextStyle(color: Colors.red)),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.red),
            onPressed: () {
              // Add search action
            },
          ),
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            buildSectionTitle(context, 'New Arrival'),
            buildHorizontalItemList([
              {
                'name': 'Dimoo',
                'imagePath': 'assets/images/Dimoo.png',
                'price': 'THB1,050'
              },
              {
                'name': 'MEGA LABUBU TEC ',
                'imagePath': 'assets/images/product-2.jpg',
                'price': 'THB1,200'
              },
              {
                'name': 'LABUBU × PRONOUNCE-BE',
                'imagePath': 'assets/images/Labubup.jpg',
                'price': 'THB950'
              },
              {
                'name': 'Kung Fu Panda ',
                'imagePath': 'assets/images/Panda.jpg',
                'price': 'THB1,500'
              },
              {
                'name': 'MOLLY Metamorphose ',
                'imagePath': 'assets/images/Molly.jpg',
                'price': 'THB1,500'
              },
              {
                'name': 'MEGA SPACE MOLLY 1000%',
                'imagePath': 'assets/images/Molly1000.jpg',
                'price': 'THB31,900'
              },
            ]),
            buildSectionTitle(context, 'COLLABORATION'),
            buildHorizontalItemList([
              {
                'name': 'Buzz Lightyear',
                'imagePath': 'assets/images/Lightyear.jpg',
                'price': 'THB3,690'
              },
              {
                'name': 'Wizard Dynasty Ron',
                'imagePath': 'assets/images/Wizard.jpg',
                'price': 'THB1,550'
              },
              {
                'name': 'Snoopy Chill at Home',
                'imagePath': 'assets/images/Snoopy.jpg',
                'price': 'THB380'
              },
              {
                'name': 'Minions At Work ',
                'imagePath': 'assets/images/Minions.jpg',
                'price': 'THB380'
              },
            ]),
            buildSectionTitle(context, 'LIMITED EDITION'),
            buildHorizontalItemList([
              {
                'name': 'Christmas limited edition Dimoo',
                'imagePath': 'assets/images/Christmas Dimoo.jpg',
                'price': 'THB1,050'
              },
              {
                'name': 'MEGA·JUST DIMOO 1000%',
                'imagePath': 'assets/images/Dimoo1000.jpg',
                'price': 'THB31,900'
              },
              {
                'name': 'skull400',
                'imagePath': 'assets/images/skull400.jpg',
                'price': 'THB1,600'
              },
            ]),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'My Purchases'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Profile'),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.red,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/ProductPage');
                break;
              case 1:
                Navigator.pushNamed(context, '/MyPurchases');
                break;
              case 2:
                Navigator.pushNamed(context, '/ProfilePage'); // นำทางไปยัง ProfilePage
                break;
            }
          });
        },
      ),
    );
  }

  // เมธอดที่มีอยู่


  Widget buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.red)),
          TextButton(
            style: TextButton.styleFrom(primary: Colors.red),
            child: Text('See More'),
            onPressed: () {
              // Add see more action
            },
          ),
        ],
      ),
    );
  }

  Widget buildHorizontalItemList(List<Map<String, dynamic>> items) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: items.map((item) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: createProductCard(
                context, item['name'], item['imagePath'], item['price']),
          );
        }).toList(),
      ),
    );
  }

  Widget createProductCard(
      BuildContext context, String name, String imagePath, String price) {
    return GestureDetector(
      onTap: () {
        // Navigate to ProductDetailPage with product details
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetailPage(
                  name: name, imagePath: imagePath, price: price)),
        );
      },
      child: Container(
        width: 160, // Set a fixed width for each card
        child: Card(
          elevation: 5, // Add some elevation for shadow
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to the left
            children: <Widget>[
              AspectRatio(
                aspectRatio: 3 / 4, // Ensure the image is displayed properly
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(4), // Adjust the rounding as needed
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit
                        .cover, // This will cover the area without stretching the image
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  name,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold), // Display the product name
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
                child: Text(
                  price,
                  style: TextStyle(fontSize: 14), // Display the product price
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
