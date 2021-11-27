import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lopez_store_app/resources/resources.dart';

import 'car_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class TabScreens extends StatefulWidget {
  @override
  _TabScreensState createState() => _TabScreensState();
}

class _TabScreensState extends State<TabScreens> {
  int _selectedScreenIndex = 0;

  List<Widget> _screens = <Widget>[
    HomeScreen(),
    CarScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: _screens.elementAt(_selectedScreenIndex),
      ),
      bottomNavigationBar: _curvedTabs(size),
      
    );
  }
  Widget _curvedTabs(Size size){
    return CurvedNavigationBar(
      color: Resources().primaryColor,
      animationDuration: Duration(seconds: 1),
      backgroundColor: Resources().whiteColor,
      animationCurve: Curves.easeInCubic,
      height: size.height * 0.065,
      items: [
        Icon(Icons.home, color: Resources().secondaryColor, semanticLabel: 'Home',),
        Icon(Icons.shopping_cart_sharp, color: Resources().secondaryColor, semanticLabel: 'Carrito',),
        Icon(Icons.person, color: Resources().secondaryColor, semanticLabel: 'Perfil',)
      ],
      onTap: (index) {
          setState(() {
            _selectedScreenIndex = index;
          });
        },
    );
  }
  Widget _tabs(Size size) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Resources().secondaryColor),
      child: BottomNavigationBar(
        unselectedItemColor: Resources().secondaryColor.withOpacity(0.5),
        selectedItemColor: Resources().secondaryColor,
        currentIndex: _selectedScreenIndex,
        onTap: (index) {
          setState(() {
            _selectedScreenIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Inicio', style: GoogleFonts.baloo(),)),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text('Carrito', style: GoogleFonts.baloo(),)),
          BottomNavigationBarItem(icon: Icon(Icons.person), title: Text('Perfil', style: GoogleFonts.baloo(),)),
        ],
      ),
    );
  }
}
