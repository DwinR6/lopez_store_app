import 'package:flutter/material.dart';
import 'package:lopez_store_app/controllers/category_controller.dart';
import 'package:lopez_store_app/controllers/product_controller.dart';
import 'package:lopez_store_app/resources/resources.dart';
import 'package:lopez_store_app/views/screens/business_logup_screen.dart';
import 'package:lopez_store_app/views/screens/car_screen.dart';
import 'package:lopez_store_app/views/screens/home_screen.dart';
import 'package:lopez_store_app/views/screens/login_screen.dart';
import 'package:lopez_store_app/views/screens/profile_screen.dart';
import 'package:lopez_store_app/views/screens/tabs_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryController(),),
        ChangeNotifierProvider(create: (_) => ProductController(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lopez Store', 
        theme: ThemeData(primaryColor: Resources().primaryColor, fontFamily: 'Mont'),
        initialRoute: 'login',
        routes: {
          'login': (context) => LoginScreen(),
          'register_business': (context) => BusinessLogup(),
          'main': (context) => TabScreens(),
          'home': (context) => HomeScreen(),
          'profile': (context) => ProfileScreen(),
          'car': (context) => CarScreen(),
        },

      ),
    );
  }
}
