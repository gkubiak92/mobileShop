import 'package:flutter/material.dart';
import 'package:mobileShop/providers/models/cart.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final String id;
  final String productId;
  final String title;
  final int quantity;
  final double price;

  CartItemWidget(
      {this.id, this.productId, this.title, this.quantity, this.price});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        cart.removeItem(productId);
      },
      background: Container(
        color: Colors.black45,
        child: Icon(Icons.delete),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 20,
        ),
        margin: EdgeInsets.all(10),
      ),
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: Text("${price.toStringAsFixed(2)} x $quantity"),
              title: Text(title),
              trailing: Text("${price * quantity}"),
            )),
      ),
    );
  }
}
