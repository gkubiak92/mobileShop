import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mobileShop/providers/models/cart.dart';
import 'package:mobileShop/providers/products.dart';
import 'package:mobileShop/screens/cart_screen.dart';
import 'package:mobileShop/widgets/side_drawer.dart';
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
  var _productsLoaded = false;
  var _isLoading = false;

  @override
  void didChangeDependencies() {
    if (!_productsLoaded) {
      _isLoading = true;
      Provider.of<Products>(context)
          .getAndSetProducts()
          .then((value) => _isLoading = false);
      _productsLoaded = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
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
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGrid(_showOnlyFavourites),
    );
  }
}
