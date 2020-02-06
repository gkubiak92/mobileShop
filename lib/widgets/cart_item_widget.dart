import 'package:flutter/material.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItemWidget({this.id, this.title, this.quantity, this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Text("${price.toStringAsFixed(2)} x $quantity"),
            title: Text(title),
            trailing: Text("${price * quantity}"),
          )),
    );
  }
}
