import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lopez_store_app/controllers/product_controller.dart';
import 'package:lopez_store_app/resources/resources.dart';
import 'package:lopez_store_app/widgets/product_widget.dart';

// ignore: must_be_immutable
class ProductsView extends StatefulWidget {
  @override
  _ProductsViewState createState() => _ProductsViewState();
  final dynamic subcategories;
  ProductsView({@required this.subcategories});
}

class _ProductsViewState extends State<ProductsView> {
  ProductController _productController = new ProductController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    dynamic subcats = widget.subcategories;
    return Container(
      child: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.only(
          right: 2,
          left: 2,
        ),
        child: Column(
            children: List.generate(subcats.length, (item) {
          return Container(child: _buildSubcategory(subcats[item], size));
        })),
      )),
    );
  }

  Widget _buildSubcategory(subcat, Size size) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          height: size.height * 0.01,
        ),
        Container(
          padding: EdgeInsets.all(10),
          child: Text(subcat["subcategory_name"],
              style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.bold, fontSize: 25),
              textAlign: TextAlign.left),
          alignment: Alignment.centerLeft,
        ),
        _buildProducts(size, subcat),
        SizedBox(
          height: size.height * 0.01,
        ),
      ],
    ));
  }

  Widget _buildProducts(Size size, subcat) {
    return StreamBuilder<dynamic>(
      stream: _productController.productStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CupertinoActivityIndicator(radius: 25));
        } else {
          dynamic products = snapshot.data["products"];
          dynamic prodsub = products
              .where((i) => i["subcategory_name"] == subcat["subcategory_name"])
              .toList();
          return Container(
            alignment: Alignment.centerLeft,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsets.only(
                  right: 2,
                  left: 2,
                ),
                child: Row(
                    children: List.generate(prodsub.length, (item) {
                  return Container(child: _buildProduct(prodsub[item], size));
                })),
              ),
            ),
          );
        }
      },
    );
  }

  Widget _buildProduct(dynamic item, Size size) {
    return BuildProduct(product: item);
  }
  
}
