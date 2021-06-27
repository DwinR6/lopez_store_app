import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lopez_store_app/controllers/product_controller.dart';
import 'package:lopez_store_app/resources/resources.dart';
import 'package:lopez_store_app/widgets/product_widget.dart';

class AllCategoriesProducts extends StatefulWidget {
  @override
  _AllCategoriesProductsState createState() => _AllCategoriesProductsState();
}

class _AllCategoriesProductsState extends State<AllCategoriesProducts> {
  ProductController _productController = new ProductController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.symmetric(vertical: size.width * 0),
        //child: Text('Hola'),
        child: _body(size));
  }

  _body(Size size) {
    return StreamBuilder<dynamic>(
      stream: _productController.productStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CupertinoActivityIndicator(radius: 25));
        } else {
          dynamic products = snapshot.data["products"];
          return SingleChildScrollView(
              child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Text(
                  'Lo mas nuevo',
                  style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Resources().fontColor),
                  textAlign: TextAlign.left,
                ),
                alignment: Alignment.centerLeft,
              ),
              _buildProducts(size, products),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text('Top Ventas',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Resources().fontColor),
                    textAlign: TextAlign.left),
                alignment: Alignment.centerLeft,
              ),
              _buildProducts(size, products),
              SizedBox(
                height: size.height * 0.01,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text('Lo mas buscado',
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Resources().fontColor),
                    textAlign: TextAlign.left),
                alignment: Alignment.centerLeft,
              ),
              _buildProducts(size, products)
            ],
          ));
        }
      },
    );
  }

  Widget _buildProducts(Size size, dynamic products) {
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
              children: List.generate(products.length, (item) {
            return Container(child: _buildProduct(products[item], size));
          })),
        ),
      ),
    );
  }

  Widget _buildProduct(dynamic item, Size size) {
    return BuildProduct(product: item);
  }
}
