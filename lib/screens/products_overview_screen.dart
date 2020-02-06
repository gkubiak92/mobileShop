import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mobileShop/providers/models/cart.dart';
import 'package:mobileShop/screens/cart_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';

enum FilterOptions {
  Favourites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavourites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
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
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only favourites'),
                value: FilterOptions.Favourites,
              ),
              PopupMenuItem(
                child: Text('Show all'),
                value: FilterOptions.All,
              ),
            ],
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                selectedValue == FilterOptions.Favourites
                    ? _showOnlyFavourites = true
                    : _showOnlyFavourites = false;
              });
            },
          ),
        ],
        title: Text(
          'Woman',
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Colors.white,
      ),
      body: ProductsGrid(_showOnlyFavourites),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.shopping_cart,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {},
      ),
    );
  }
}
