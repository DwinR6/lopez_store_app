import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lopez_store_app/controllers/category_controller.dart';
import 'package:lopez_store_app/models/category_model.dart';
import 'package:lopez_store_app/resources/resources.dart';
import 'package:lopez_store_app/views/subcategories_view.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  CategoryController _categoryController = new CategoryController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: _body(size, context),
    );
  }

  _body(Size size, BuildContext context) {
    return Container(
      child: Column(
        children: [_buildCategoriesScreen(size)],
      ),
    );
  }

  _buildCategoriesScreen(Size size) {
    return StreamBuilder<List<Category>>(
      stream: _categoryController.categoryStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CupertinoActivityIndicator(radius: 25));
        } else {
          List<Category> categories = <Category>[];
          categories = categories + snapshot.data;
          return Container(
            alignment: Alignment.centerLeft,
            //decoration: BoxDecoration(
            //    border: Border(
            //        bottom:
            //            BorderSide(color: Resources().fontColor, width: 0.5))),
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.only(
                  top: 2,
                ),
                child: Wrap(
                  alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: List.generate(categories.length, (index) {
                      final item = categories[index];
                      final images = item.categoryImages;
                      final categoryImage = Container(
                        child: FadeInImage(
                          placeholder: AssetImage('assets/loading.gif'),
                          image: NetworkImage(images[0]),
                          height: size.height * 0.19,
                          width: size.width * 0.3,
                          fit: BoxFit.cover,
                        ),
                      );

                      final categorytName = Container(
                        child: Container(
                          child: Text(
                            item.categoryName,
                            style: GoogleFonts.montserrat(color: Resources().secondaryColor, fontWeight: FontWeight.bold,),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                      return Container(
                          width: size.width * 0.45,
                          height: size.height * 0.22,
                          margin: EdgeInsets.symmetric(
                              horizontal: size.width * 0.025,
                              vertical: size.height * 0.02),
                          //decoration: BoxDecoration(
                          //    borderRadius:
                          //        BorderRadius.circular(size.height * 0.010),
                          //    color: Resources().whiteColor,
                          //    boxShadow: [
                          //      BoxShadow(
                          //          color: Resources().primaryColor,
                          //          blurRadius: 0.2,
                          //          spreadRadius: 0.5,
                          //          offset: Offset(0.0, 0.5))
                          //    ]),
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(size.height * 0.010),
                            child: InkWell(
                                onTap: () {
                                  setState(() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SubCategories(selectedCategory: item, back: true)));
                                  });
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                      categoryImage,
                                      SizedBox(
                                        height: size.height * 0.005,
                                      ),
                                      Container(
                                        child: Column(children: [
                                          categorytName,
                                        ]),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10),
                                      )
                                    ],
                                  ),
                                )),
                          ));
                    })),
              ),
            ),
          );
        }
      },
    );
  }
}
