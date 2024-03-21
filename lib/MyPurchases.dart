import 'package:flutter/material.dart';

class Mypurchases extends StatefulWidget {
  final List<Map<String, dynamic>> purchasedItems;

  Mypurchases({required this.purchasedItems});

  @override
  _MyPurchasesState createState() => _MyPurchasesState();
}

class _MyPurchasesState extends State<Mypurchases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Purchases'),
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: widget.purchasedItems.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widget.purchasedItems[index]['name']),
            subtitle: Text('Quantity: ${widget.purchasedItems[index]['quantity']}'),
            trailing: Text('${widget.purchasedItems[index]['price']}'),
          );
        },
      ),
    );
  }
}

