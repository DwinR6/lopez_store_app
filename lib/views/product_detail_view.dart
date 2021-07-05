import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lopez_store_app/resources/resources.dart';
import 'package:lopez_store_app/utilities/Clipping.dart';

class ProductDetail extends StatefulWidget {
  final dynamic product;
  ProductDetail({@required this.product});
  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  int _amount = 1;

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Resources().whiteColor,
      body: CustomScrollView(
        slivers: [
          _buildHead(widget.product, size),
          SliverList(
              delegate: SliverChildListDelegate(
                  [_productInfomation(widget.product, size)]))
        ],
      ),
      floatingActionButton: _floatingBtns(size, context, widget.product),
    );
  }

  _buildHead(dynamic product, Size size) {
    final images = product["product_images"];
    return SliverAppBar(
      actions: [_showCartBtn(size, context)],
      title: Text(
        product["product_name"],
        style: GoogleFonts.montserrat(
            color: Resources().fontColor, fontWeight: FontWeight.bold),
      ),
      iconTheme: IconThemeData(color: Resources().fontColor, opacity: 1.0),
      elevation: 2,
      expandedHeight: size.height * 0.40,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Container(
          color: Resources().whiteColor,
          child: Stack(
            //alignment: Alignment.bottomRight,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: CustomPaint(
                  painter: CurvePainter(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 520.0,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [_productImage(images[0], size)],
                ),
              ),
              Container(
                //color: Resources().accentColorPink.withOpacity(0.8),
                width: size.width / 2,
                alignment: Alignment.centerRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _sold(product["sold"], size),
                    _unitInStock(product['units_in_stock']),
                    _productPrice(product['product_price'].toString(), size)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _productInfomation(dynamic product, Size size) {
    return Container(
      //padding: EdgeInsets.all(10),
      child: Column(
        children: [
          _productName(product['product_name'], size),
          _selectAmount(size, product['product_price']),
          _productDescription(product['product_description'], size),
        ],
      ),
    );
  }

  _productImage(String productImage, Size size) {
    return Container(
        padding: EdgeInsets.only(
            right: size.width * 0.02, bottom: size.height * 0.05),
        height: size.height * 0.35,
        width: size.width * 0.8,
        alignment: Alignment.bottomRight,
        child: Roulette(
          child: FadeInImage(
            placeholder: AssetImage("assets/loading.gif"),
            image: AssetImage("assets/ims.png"),
            fit: BoxFit.fill,
          ),
        ));
  }

  _unitInStock(int unitInStock) {
    return Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(
              unitInStock.toString(),
              style: GoogleFonts.montserrat(
                  color: Resources().fontColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Disponibles',
              style: GoogleFonts.montserrat(color: Resources().fontColor),
            )
          ],
        ));
  }

  _sold(int sold, Size size) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Text(
              sold.toString(),
              style: GoogleFonts.montserrat(
                  color: Resources().fontColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              'Vendidos',
              style: GoogleFonts.montserrat(color: Resources().fontColor),
            )
          ],
        ));
  }

  _productName(String productName, Size size) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.03, horizontal: size.width * 0.03),
      child: Text(productName,
          style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              color: Resources().fontColor,
              fontSize: 25)),
    );
  }

  _productDescription(String productDescription, Size size) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Text("Acerca del producto",
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Resources().fontColor)),
            alignment: Alignment.centerLeft,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: size.height * 0.025),
            child: Text(productDescription,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.normal,
                    color: Resources().fontColor,
                    fontSize: 18,
                    height: 2)),
          ),
        ],
      ),
    );
  }

  _productPrice(String productPrice, Size size) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: size.height * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('\$ $productPrice',
                style: GoogleFonts.montserrat(
                    color: Resources().fontColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 25)),
            Text('Precio',
                style: GoogleFonts.montserrat(color: Resources().fontColor))
          ],
        ));
  }

  _selectAmount(Size size, double productPrice) {
    final btnStyle = ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: MaterialStateProperty.all(Resources().primaryColor),
        shape: MaterialStateProperty.all<CircleBorder>(CircleBorder()));

    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.zero,
            decoration: BoxDecoration(
                color: Resources().primaryColor,
                boxShadow: [
                  BoxShadow(
                      blurRadius: 0.2,
                      color: Resources().fontColor,
                      offset: Offset(0, 0.6),
                      spreadRadius: 0.7)
                ],
                borderRadius: BorderRadius.circular(25)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: btnStyle,
                  child: Icon(
                    Icons.remove,
                    color: Resources().fontColor,
                  ),
                  onPressed: _diminishAmount,
                ),
                Container(
                  child: Text('${this._amount}',
                      style: GoogleFonts.montserrat(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Resources().fontColor)),
                  decoration: BoxDecoration(),
                ),
                ElevatedButton(
                  style: btnStyle,
                  child: Icon(Icons.add, color: Resources().fontColor),
                  onPressed: _increaseAmount,
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Text(
              '\$ ${this._amount * productPrice}',
              style: GoogleFonts.montserrat(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Resources().fontColor),
            ),
          )
        ],
      ),
    );
  }

  _floatingBtns(Size size, BuildContext context, product) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: 60,
      //padding: EdgeInsets.all(5),
      width: size.width,
      margin: EdgeInsets.only(left: size.width * 0.084, right: 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //_showCartBtn(size, context),
          _addToCartBtn(size, context, product)
        ],
      ),
    );
  }

  _showCartBtn(Size size, BuildContext context) {
    final btnStyle = ButtonStyle(      
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        shadowColor: MaterialStateProperty.all(Colors.transparent),
        backgroundColor: MaterialStateProperty.all(Resources().primaryColor),
        shape: MaterialStateProperty.all<CircleBorder>(CircleBorder()));
    return Container(
      child: ElevatedButton(        
        style: btnStyle,
        child: Icon(Icons.shopping_cart, color: Resources().fontColor), onPressed: (){},),
    );
  }

  _addToCartBtn(Size size, BuildContext context, product) {
    return Container(
        alignment: Alignment.bottomCenter,
        width: size.width * 0.4,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Resources().fontColor,
            boxShadow: [
              BoxShadow(
                  color: Resources().whiteColor,
                  blurRadius: 0.5,
                  spreadRadius: 0.5,
                  offset: Offset(0.3, 0.9))
            ]),
        child: InkWell(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.add_shopping_cart,color: Resources().primaryColor,),
                  Text(
                    'Agregar', 
                    style: GoogleFonts.montserrat(color: Resources().primaryColor, fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  
                ],
              ),
            )));
  }

  void _increaseAmount() {
    this._amount++;
    setState(() {});
  }

  void _diminishAmount() {
    if (this._amount > 1) {
      this._amount--;
    }
    setState(() {});
  }
}
