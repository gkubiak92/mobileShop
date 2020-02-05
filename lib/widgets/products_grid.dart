import 'package:flutter/material.dart';
import 'package:mobileShop/providers/products.dart';
import 'package:provider/provider.dart';

import 'product_item.dart';

class ProductsGrid extends StatelessWidget {
  final showOnlyFavourites;

  ProductsGrid(this.showOnlyFavourites);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showOnlyFavourites
        ? productsData.favouritesItemsOnly
        : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        crossAxisSpacing: 20,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) {
        return ChangeNotifierProvider.value(
          value: products[i],
          child: ProductItem(
              // products[i].id,
              // products[i].title,
              // products[i].price,
              // products[i].imageUrl,
              ),
        );
      },
      itemCount: products.length,
    );
  }
}
