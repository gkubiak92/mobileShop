import 'package:flutter/material.dart';
import 'package:mobileShop/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
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

  List<Product> get items {
    return [..._items];
  }

  Product getById(String id) {
    return items.firstWhere((product) => product.id == id);
  }

  void addProduct() {
    // _items.add(value);
    notifyListeners();
  }
}
