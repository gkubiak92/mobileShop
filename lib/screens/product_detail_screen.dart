import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mobileShop/providers/models/cart.dart';
import 'package:mobileShop/providers/products.dart';
import 'package:mobileShop/widgets/size_button.dart';
import 'package:provider/provider.dart';

import 'cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context).settings.arguments;
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).getById(productId);
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          loadedProduct.title,
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              badgeColor: Colors.deepOrange,
              child: ch,
              badgeContent: Text(
                cart.getItemsCount().toString(),
              ),
              position: BadgePosition.topRight(top: 2, right: 2),
            ),
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () =>
                  Navigator.of(context).pushNamed(CartScreen.routeName),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Image.network(loadedProduct.imageUrl),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    loadedProduct.title,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  Text(
                    "${loadedProduct.price.toStringAsFixed(2)} €",
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: <Widget>[Text(loadedProduct.description)],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Choose your size:',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                  )
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizeButton('XS'),
                    SizeButton('S'),
                    SizeButton('M'),
                    SizeButton('L'),
                    SizeButton('XL'),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 200,
                    child: RaisedButton(
                      color: Colors.black,
                      child: Text(
                        'ORDER NOW',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        cart.addItem(productId, loadedProduct.price,
                            loadedProduct.title);
                      },
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
