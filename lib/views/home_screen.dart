import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lopez_store_app/controllers/category_controller.dart';
import 'package:lopez_store_app/controllers/product_controller.dart';
import 'package:lopez_store_app/models/category_model.dart';
import 'package:lopez_store_app/resources/resources.dart';
import 'package:lopez_store_app/views/all_products_screen.dart';
import 'package:lopez_store_app/views/subcategories_view.dart';
import 'package:lopez_store_app/views/secon_content.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryController _categoryController = new CategoryController();
  ProductController _productController = new ProductController();

  int activeOption = 0;
  dynamic category;
  List<Widget> screenOptions = [
    AllCategoriesProducts(),
    SecondContent(),
    AllCategoriesProducts(),
    SecondContent(),
    AllCategoriesProducts(),
    SecondContent()
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(body: _body(context, size));
  }
  /**Widget _crearAppBar(Size size, BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.transparent,
      expandedHeight: size.height * 0.16,
      floating: true,
      pinned: true,
      automaticallyImplyLeading: true,
      flexibleSpace: FlexibleSpaceBar(
        title:  ListView(scrollDirection: Axis.horizontal, children: [Text('data', style: TextStyle(color: Resources().primaryColor),), Text('data', style: TextStyle(color: Resources().primaryColor))],),
        centerTitle: true,
        collapseMode: CollapseMode.pin,
        background: Container(
          child: Stack(
            fit: StackFit.expand,
            children: [_searchBar(size, context)],
          ),
        ),
      ),
    );
  }**/

  Widget _searchBar(Size size, BuildContext context) {
    return GestureDetector(
      //onTap: () => showSearch(context: context, delegate: BuscarMenus()),
      child: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.019, vertical: size.height * 0.0055),
        child: Align(
          alignment: Alignment.topCenter,
          child: BounceInDown(
            child: Container(
              decoration: BoxDecoration(
                  color: Resources().primaryColor.withOpacity(1),
                  borderRadius: BorderRadius.circular(6),
                  //boxShadow: [
                  //  BoxShadow(
                  //      color: Colors.black12,
                  //      blurRadius: 5,
                  //      offset: Offset(0, 5))
                  //]
              ),
              height: size.height * 0.05,
              width: double.infinity,
              child: _inputSearchBar(size, context),
            ),
          ),
        ),
      )),
    );
  }

  Widget _inputSearchBar(Size size, BuildContext context) {
    return Row(
      children: [
        SizedBox(width: size.width * 0.03),
        Icon(Icons.search, color: Resources().fontColor.withOpacity(0.7)),
        SizedBox(width: size.width * 0.05),
        Text('Buscar Productos',
            style: GoogleFonts.baloo(color: Resources().fontColor))
      ],
    );
  }

  Widget _body(BuildContext context, Size size) {
    return Container(
      child: Column(
        children: [ 
          Container(
            decoration: BoxDecoration(
              color: Resources().whiteColor,
              //gradient: LinearGradient(
              //  begin: Alignment.topCenter,
              //  end: Alignment.bottomCenter,
              //  colors: [Resources().primaryColor, Resources().primaryColor.withOpacity(0.5), Resources().primaryColor.withOpacity(0.//2)],
              //  stops: [0.1, 0.5, 0.8]
              //)
            ),
            child: Column(
              children: [
                _searchBar(size, context), 
                _optionPanel(size)
              ],
            ),
          ),
          _content()
        ],
      ),
    );
  }

  Widget _optionPanel(Size size) {
    return StreamBuilder<List<Category>>(
      stream: _categoryController.categoryStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CupertinoActivityIndicator(radius: 25));
        } else {
          List<Category> categories = <Category>[];
          categories.add(new Category(
              categoryName: "Todos los Productos",
              categoryImages: [
                'https://outfitsandoutings.com/wp-content/uploads/2019/04/best-baby-products-on-amazon2.png'
              ]));
          categories = categories + snapshot.data;
          return Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Resources().fontColor, width: 0.5))),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: const EdgeInsets.only(
                  right: 2,
                  left: 2,
                ),
                child: Row(
                    children: List.generate(categories.length, (index) {
                  return Container(
                    padding: const EdgeInsets.only(right: 0),
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            activeOption = index;
                            category = categories[index];
                          });
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 3,
                                      color: activeOption == index
                                          ? Resources().fontColor
                                          : Colors.transparent)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 0.8, horizontal: 2),
                                  child: Text(categories[index].categoryName,
                                      style: GoogleFonts.montserrat(
                                          fontSize: 15,
                                          color: activeOption == index
                                              ? Resources().fontColor
                                              : Resources().fontColor.withOpacity(0.5))),
                                ),
                                Container(
                                  height: size.height * 0.02 ,
                                  width: size.width * 0.03,
                                  child: Image(
                                      image: NetworkImage(
                                          categories[index].categoryImages[0]),
                                      fit: BoxFit.cover),
                                )
                              ],
                            ))),
                  );
                })),
              ),
            ),
          );
        }
      },
    );
  }

  _content() {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(color: Resources().whiteColor.withOpacity(1)),
        child: activeOption == 0 ? screenOptions.elementAt(activeOption): SubCategories(selectedCategory: category,)
      ),
    );
  }
}
