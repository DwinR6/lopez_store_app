import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lopez_store_app/controllers/category_controller.dart';
import 'package:lopez_store_app/controllers/product_controller.dart';
import 'package:lopez_store_app/resources/resources.dart';
import 'package:lopez_store_app/views/products_view.dart';
import 'package:provider/provider.dart';

class SubCategories extends StatefulWidget {
  final bool back;
  final dynamic selectedCategory;
  SubCategories({@required this.selectedCategory, @required this.back});
  @override
  _SubCategoriesState createState() => _SubCategoriesState();
}

class _SubCategoriesState extends State<SubCategories> {
  CategoryController _subcategoryController = new CategoryController();
  ProductController _productController = new ProductController();

  @override
  Widget build(BuildContext context) {
    dynamic cat = widget.selectedCategory;
    final categoriesProvider = Provider.of<CategoryController>(context);
    final productsProvider = Provider.of<ProductController>(context);
    final back = widget.back;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: back ? AppBar(backgroundColor: Resources().primaryColor, iconTheme: IconThemeData(color: Resources().accentColor),): null,
      backgroundColor: Resources().whiteColor,
      body: _body(size, cat),
    );
  }

  Widget _body(Size size, cat) {
    return StreamBuilder<dynamic>(
        stream: _subcategoryController.subcategoryStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CupertinoActivityIndicator(radius: 25));
          } else {
            dynamic data = snapshot.data["subcategories"];
            dynamic subcats = data
                .where((i) => i["category_name"] == cat.categoryName)
                .toList();
            //hay que filtrar las subcats por category_name
            return Container(
                child: ProductsView(
              subcategories: subcats,
            ));
          }
        });
  }
}
