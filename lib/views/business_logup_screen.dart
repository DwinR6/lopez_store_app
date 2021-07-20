import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lopez_store_app/resources/resources.dart';
import 'package:lopez_store_app/widgets/input_w.dart';

class BusinessLogup extends StatefulWidget {
  @override
  _BusinessLogupState createState() => _BusinessLogupState();
}

class _BusinessLogupState extends State<BusinessLogup> {
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  bool _loading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: _body(size),
    );
  }

  _body(Size size) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Resources().primaryColor,
          Resources().primaryColor.withOpacity(1),
          Resources().primaryColor.withOpacity(1),
          Resources().primaryColor.withOpacity(1),
          Resources().primaryColor.withOpacity(1),
        ],
        stops: [0.1, 0.4, 0.7, 0.9, 1],
      )),
      padding: EdgeInsets.only(top: size.height * 0.05, bottom: size.height * 0.0),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              children: [
                _title(),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Resources().fontColor.withOpacity(0.0),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Column(
                    children: [
                      _generalData(),
                      SizedBox(height: 40,),
                      _direction(),
                    ],
                  ),
                ),

                SizedBox(height: size.height * 0.05),
                _logupButton(size),
                //SizedBox(height: size.height * 0.05),
                //_loginButton(),
                //SizedBox(height: size.height * 0.02),
                //_socialLoginButtons(),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      'Registro Negocio',
      style: GoogleFonts.montserrat(
          fontWeight: FontWeight.bold,
          fontSize: 29,
          color: Resources().secondaryColor.withOpacity(0.9)),
    );
  }

  Widget _lopezIcon(Size size) {
    final icon_decoration =
        BoxDecoration(borderRadius: BorderRadius.circular(50), boxShadow: [
      BoxShadow(
          color: Resources().secondaryColor.withOpacity(0.1),
          spreadRadius: 2,
          blurRadius: 20,
          offset: Offset(0, 5))
    ]);
    return Container(
      decoration: icon_decoration,
      child: CircleAvatar(
          radius: size.width * 0.15,
          backgroundImage: AssetImage('assets/lopez_icon.jpg')),
    );
  }

  Widget _generalData() {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              'Datos Generales', 
              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Resources().fontColor),
            ), 
            alignment: Alignment.topLeft,
          ),
          Input(
            icon: Icons.business,
            placeholder: 'Razon Social',
            textController: null,
            keyboardType: TextInputType.emailAddress,
          ),
          Input(
              icon: Icons.fiber_pin,
              placeholder: 'Codigo',
              textController: null,
              keyboardType: TextInputType.number),
          Input(
            icon: Icons.business_center,
            placeholder: 'Nombre Comercial',
            textController: null,
          ),
        ],
      ),
    );
  }

  _logupButton(Size size) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.025, horizontal: size.width * 0.2),
        onPressed: !_loading
            ? () async {
                _login();
              }
            : null,
        child: Text('Registar',
            style: GoogleFonts.montserrat(
                fontSize: 16,
                color: Resources().primaryColor,
                fontWeight: FontWeight.bold)),
        color: Resources().secondaryColor,
        textColor: Colors.white,
        splashColor: Resources().primaryColor,
      ),
    ),);
  }

  _login() {
    Navigator.of(context).pushReplacementNamed('main');
  }

  _loginButton() {
    return Container(
      child: GestureDetector(
        child: Text('Iniciar Sesion!',
            style: GoogleFonts.montserrat(
                color: Resources().secondaryColor,
                fontSize: 15,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline)),
        //onTap: () => Navigator.of(context).pushReplacementNamed('registro')
      ),
    );
  }

  _socialLoginButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _socialButton(
            () => print('Login with Facebook'),
            AssetImage(
              'assets/facebook.png',
            ),
          ),
          _socialButton(
            () => print('Login with Google'),
            AssetImage(
              'assets/google.png',
            ),
          ),
        ],
      ),
    );
  }

  Widget _socialButton(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60.0,
        width: 60.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _direction() {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              'Dirección', 
              style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, color: Resources().fontColor),
            ), 
            alignment: Alignment.topLeft,
          ),
          Input(
            icon: Icons.location_on,
            placeholder: 'Departamento',
            textController: null,
            keyboardType: TextInputType.emailAddress,
          ),
          Input(
              icon: Icons.location_on,
              placeholder: 'Municipio',
              textController: null,
              keyboardType: TextInputType.number),
          Input(
            icon: Icons.location_on,
            placeholder: 'Colonia',
            textController: null,
          ),
          Input(
            icon: Icons.location_on,
            placeholder: 'Calle o Avenida',
            textController: null,
          ),
        ],
      ),
    );
  }
}
