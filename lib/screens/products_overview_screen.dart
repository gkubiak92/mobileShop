import 'package:flutter/material.dart';
import 'package:mobileShop/models/product.dart';
import 'package:mobileShop/widgets/product_item.dart';

class ProductsOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Pink Shirt',
      description: 'Pink woman T-Shirt',
      price: 29.99,
      imageUrl:
          'https://cdn.aboutstatic.com/file/01a1b138ca2197051c2cd6ee6518e296?quality=70&progressive=true&width=1000&height=1000',
    ),
    Product(
      id: 'p2',
      title: 'Leggings',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://cdn.aboutstatic.com/file/829359adf53bed93ff0b362cf77ea409?quality=70&progressive=true&width=1000&height=1000',
    ),
    Product(
      id: 'p3',
      title: 'Sprot dress',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 129.99,
      imageUrl:
          'http://cdn.aboutstatic.com/file/86b9bf5924517c75fe18ae68e18e5713?quality=90&progressive=1&width=800&height=800',
    ),
    Product(
      id: 'p4',
      title: 'Warm sweater',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'http://cdn.aboutstatic.com/file/8d3c5720196a033b6abefe4db8c1e676?quality=90&progressive=1&width=800&height=800',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
        title: Text(
          'Woman',
          style: Theme.of(context).textTheme.headline1,
        ),
        backgroundColor: Colors.white,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2 / 3,
          crossAxisSpacing: 20,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => ProductItem(
          loadedProducts[i].id,
          loadedProducts[i].title,
          loadedProducts[i].price,
          loadedProducts[i].imageUrl,
        ),
        itemCount: loadedProducts.length,
      ),
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
