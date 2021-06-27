import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lopez_store_app/resources/resources.dart';
import 'package:lopez_store_app/views/product_detail_view.dart';

class BuildProduct extends StatefulWidget {
  final dynamic product;

  BuildProduct({@required this.product});
  @override
  _BuildProductState createState() => _BuildProductState();
}

class _BuildProductState extends State<BuildProduct> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: _product(widget.product, size),
    );
  }

  _product(dynamic item, Size size) {
    final images = item["product_images"];
    final productImage = Container(
      child: FadeInImage(
        placeholder: AssetImage('assets/loading.gif'),
        image: AssetImage('assets/ims.png'),
        height: size.height * 0.12,
        width: size.width * 0.4,
        fit: BoxFit.cover,
      ),
    );

    final productName = Container(
      child: FittedBox(
        child: Text(
          item['product_name'],
          style: GoogleFonts.montserrat(color: Resources().fontColor),
        ),
      ),
    );
    final productPrice = Container(
      child: FittedBox(
        child: Text(
          item['product_price'].toString(),
          style: GoogleFonts.montserrat(color: Resources().fontColor),
        ),
      ),
    );
    return Container(
        height: size.height * 0.24,
        margin: EdgeInsets.symmetric(
            horizontal: size.width * 0.025, vertical: size.height * 0.02),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.height * 0.017),
            color: Resources().whiteColor,
            boxShadow: [
              BoxShadow(
                  color: Resources().primaryColor,
                  blurRadius: 0.2,
                  spreadRadius: 0.5,
                  offset: Offset(0.0, 0.5))
            ]),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(size.height * 0.017),
          child: InkWell(
              onTap: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductDetail(
                                product: item,
                              )));
                });
              },
              child: Container(
                child: Column(
                  children: [
                    productImage,
                    SizedBox(
                      height: size.height * 0.009,
                    ),
                    productName,
                    productPrice,
                  ],
                ),
              )),
        ));
  }
}
