import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobileShop/providers/models/orders.dart';
import 'package:intl/intl.dart';

class OrderItemWidget extends StatefulWidget {
  final OrderItem order;

  OrderItemWidget(this.order);

  @override
  _OrderItemWidgetState createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('${widget.order.amount.toStringAsFixed(2)}€'),
            subtitle: Text(
              DateFormat('dd MM yyyy').format(widget.order.dateTime),
            ),
            trailing: IconButton(
              icon: Icon(_expanded ? Icons.expand_less : Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expanded = !_expanded;
                });
              },
            ),
          ),
          if (_expanded)
            Container(
              height: min(widget.order.products.length * 20.0 + 100, 180),
              child: ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                itemBuilder: (ctx, i) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '${widget.order.products[i].title} x${widget.order.products[i].quantity}',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      '${widget.order.products[i].price * widget.order.products[i].quantity}€',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
                itemCount: widget.order.products.length,
              ),
            ),
        ],
      ),
    );
  }
}
