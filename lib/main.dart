import 'package:flutter/material.dart';
import 'package:mobileShop/providers/models/cart.dart';
import 'package:mobileShop/screens/cart_screen.dart';
import 'package:provider/provider.dart';

import 'package:mobileShop/screens/product_detail_screen.dart';
import 'package:mobileShop/screens/products_overview_screen.dart';
import 'package:mobileShop/providers/products.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cart()),
      ],
      child: MaterialApp(
        title: 'mobileShop',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
          textTheme: TextTheme(
            headline1: TextStyle(
              fontFamily: 'Anton',
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
