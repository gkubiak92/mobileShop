import 'package:flutter/material.dart';
import 'package:mobileShop/providers/models/orders.dart';
import 'package:mobileShop/widgets/order_item_widget.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Your orders',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, i) => OrderItemWidget(
            orderData.orders[i],
          ),
          itemCount: orderData.orders.length,
        ));
  }
}
