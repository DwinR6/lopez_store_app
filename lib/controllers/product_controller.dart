import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lopez_store_app/models/product_model.dart';

class ProductController with ChangeNotifier {
  ProductController() {
    getProducts();
  }
  StreamController<dynamic> _productController =
      new StreamController.broadcast();
  Stream<dynamic> get productStream => _productController.stream;

  Future<void> getProducts() async {
    final String response =
        await rootBundle.loadString('assets/json/products.json');
    var items = json.decode(response);
    var cats = Products.fromJson(items).products;

    _productController.sink.add(items);
    notifyListeners();
  }

  dispose() {
    _productController?.close();
  }
}
