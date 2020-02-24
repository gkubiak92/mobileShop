import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobileShop/providers/models/product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _items = [];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get favouritesItemsOnly {
    return [..._items.where((e) => e.isFavourite)];
  }

  Product getById(String id) {
    return items.firstWhere((product) => product.id == id);
  }

  Future<void> getAndSetProducts() async {
    const url = 'https://flutter-mobile-shop.firebaseio.com/products.json';
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Product> loadedProducts = [];

      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(
          Product(
            id: prodId,
            title: prodData['title'],
            price: prodData['price'],
            description: prodData['description'],
            imageUrl: prodData['imageUrl'],
          ),
        );
      });
      _items = loadedProducts;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addProduct(Product product) async {
    const url = 'https://flutter-mobile-shop.firebaseio.com/products.json';

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'id': product.id,
          'title': product.title,
          'price': product.price,
          'description': product.description,
          'imageUrl': product.imageUrl
        }),
      );

      final newProduct = Product(
        id: json.decode(response.body)['name'],
        title: product.title,
        description: product.description,
        imageUrl: product.imageUrl,
        price: product.price,
      );
      _items.add(newProduct);
      notifyListeners();
    } catch (error) {
      print('error from products.dart');
      throw (error);
    }
  }

  Future<void> updateProduct(Product updatedProduct) async {
    final productIndex =
        _items.indexWhere((oldProduct) => oldProduct.id == updatedProduct.id);
    if (productIndex >= 0) {
      final url =
          'https://flutter-mobile-shop.firebaseio.com/products/${updatedProduct.id}.json';
      final updatedProductJSON = json.encode({
        'title': updatedProduct.title,
        'price': updatedProduct.price,
        'description': updatedProduct.description,
        'imageUrl': updatedProduct.imageUrl,
      });
      await http.patch(url, body: updatedProductJSON);
      _items[productIndex] = updatedProduct;
      notifyListeners();
    }
  }

  void removeProduct(productId) {
    final productIndex =
        _items.indexWhere((product) => product.id == productId);
    if (productIndex >= 0) {
      final url =
          'https://flutter-mobile-shop.firebaseio.com/products/${productId}.json';
      http.delete(url);
      _items.removeAt(productIndex);
      notifyListeners();
    }
  }
}
