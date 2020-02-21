import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobileShop/providers/models/product.dart';
import 'package:http/http.dart' as http;

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
      description: '',
      price: 49.99,
      imageUrl:
          'http://cdn.aboutstatic.com/file/8d3c5720196a033b6abefe4db8c1e676?quality=90&progressive=1&width=800&height=800',
    ),
    Product(
      id: 'p5',
      title: 'Kardigan',
      description: '',
      price: 69.99,
      imageUrl:
          'https://cdn.aboutstatic.com/file/dc2990a815fbc1b9068cc6348628db25?quality=70&progressive=true&width=800&height=800',
    ),
    Product(
      id: 'p6',
      title: 'Black shirt',
      description: '',
      price: 39.99,
      imageUrl:
          'https://cdn.aboutstatic.com/file/9cf61b89c33b80698e2d0ad6ac94e3c5?quality=70&progressive=true&width=800&height=800',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favouritesItemsOnly {
    return [..._items.where((e) => e.isFavourite)];
  }

  Product getById(String id) {
    return items.firstWhere((product) => product.id == id);
  }

  Future<void> addProduct(Product product) {
    const url = 'https://flutter-mobile-shop.firebaseio.com/producas';
    return http
        .post(
      url,
      body: json.encode({
        'id': product.id,
        'title': product.title,
        'price': product.price,
        'description': product.description,
        'imageUrl': product.imageUrl
      }),
    )
        .then((res) {
      final newProduct = Product(
        id: json.decode(res.body)['name'],
        title: product.title,
        description: product.description,
        imageUrl: product.imageUrl,
        price: product.price,
      );
      _items.add(newProduct);
      notifyListeners();
    }).catchError((error) {
      print('error from products.dart');
      throw (error);
    });
  }

  void updateProduct(Product updatedProduct) {
    final productIndex =
        _items.indexWhere((oldProduct) => oldProduct.id == updatedProduct.id);
    if (productIndex >= 0) {
      _items[productIndex] = updatedProduct;
      notifyListeners();
    }
  }

  void removeProduct(productId) {
    final productIndex =
        _items.indexWhere((product) => product.id == productId);
    if (productIndex >= 0) {
      _items.removeAt(productIndex);
      notifyListeners();
    }
  }
}
