import 'package:flutter/material.dart';
import 'package:mobileShop/screens/product_detail_screen.dart';
import 'package:mobileShop/screens/products_overview_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      },
    );
  }
}
