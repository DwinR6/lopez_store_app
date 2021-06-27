import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:lopez_store_app/models/category_model.dart';

class CategoryController with ChangeNotifier{
  CategoryController() {
    getCategories();
    getSubCategories();
  }

  StreamController<List<Category>> _categoryController =
      new StreamController.broadcast();
  Stream<List<Category>> get categoryStream => _categoryController.stream;

  StreamController<dynamic> _subcategoryController = new StreamController();
  Stream<dynamic> get subcategoryStream => _subcategoryController.stream;
  Future<void> getCategories() async {
    final String response =
        await rootBundle.loadString('assets/json/categories.json');
    var items = json.decode(response);
    var cats = Categories.fromJson(items).categories;

    _categoryController.sink.add(cats);
  }

  Future<void> getSubCategories() async {
    final String response =
        await rootBundle.loadString('assets/json/categories.json');
    var items = json.decode(response);

    _subcategoryController.sink.add(items);
  }

  dispose() {
    _categoryController?.close();
    _subcategoryController?.close();
  }
}
