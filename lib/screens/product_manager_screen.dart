import 'package:flutter/material.dart';
import 'package:mobileShop/providers/products.dart';
import 'package:mobileShop/screens/edit_product_screen.dart';
import 'package:mobileShop/widgets/product_manager_list_tile.dart';
import 'package:provider/provider.dart';

class ProductManagerScreen extends StatelessWidget {
  static const routeName = '/product-manager';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Manage products',
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () =>
                Navigator.of(context).pushNamed(EditProductScreen.routeName),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: ListView.builder(
          itemBuilder: (_, i) => ProductManagerListTile(
            id: productsData.items[i].id,
            imageUrl: productsData.items[i].imageUrl,
            title: productsData.items[i].title,
          ),
          itemCount: productsData.items.length,
        ),
      ),
    );
  }
}
