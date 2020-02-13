import 'package:flutter/material.dart';
import 'package:mobileShop/providers/models/cart.dart';
import 'package:mobileShop/providers/models/product.dart';
import 'package:mobileShop/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final double price;
  // final String imageUrl;

  // const ProductItem(this.id, this.title, this.price, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);
    return GridTile(
      header: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          IconButton(
            icon: product.isFavourite
                ? Icon(Icons.favorite, color: Colors.black)
                : Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
            onPressed: () => product.toggleFavouriteStatus(),
          ),
        ],
      ),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(
          ProductDetailScreen.routeName,
          arguments: product.id,
        ),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.network(product.imageUrl),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    icon: Icon(Icons.add_shopping_cart),
                    onPressed: () {
                      cart.addItem(product.id, product.price, product.title);
                      Scaffold.of(context).hideCurrentSnackBar();
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Added ${product.title} to basket'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () => cart.removeItem(product.id),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    product.title,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    "${product.price} €",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
