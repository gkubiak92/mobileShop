import 'package:flutter/material.dart';
import 'package:mobileShop/providers/models/cart.dart';
import 'package:mobileShop/widgets/cart_item_widget.dart';
import 'package:provider/provider.dart';
import '../widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cartscreen';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your cart',
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Total',
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Chip(
                        label: Text(
                          cart.totalAmount.toStringAsFixed(2),
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        backgroundColor: Colors.transparent,
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.black,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      FlatButton(
                        child: Text('ORDER NOW'),
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, i) {
                return CartItemWidget(
                    id: cart.items.values.toList()[i].id,
                    price: cart.items.values.toList()[i].price,
                    quantity: cart.items.values.toList()[i].quantity,
                    title: cart.items.values.toList()[i].title);
              },
              itemCount: cart.getItemsCount(),
            ),
          )
        ],
      ),
    );
  }
}
