import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lopez_store_app/resources/resources.dart';
import 'package:lopez_store_app/widgets/input_w.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  Widget _body(Size size) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Resources().primaryColor,
            Resources().primaryColor.withOpacity(0.7),
            Resources().primaryColor.withOpacity(0.4),
            Resources().primaryColor.withOpacity(0.1),
            Resources().primaryColor.withOpacity(0.05),
          ],
          stops: [0.1, 0.4, 0.7, 0.9, 0.95],
        )
      ),
      padding: EdgeInsets.only(top: size.height * 0.05, bottom: size.height * 0.07),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              children: [
                SizedBox(height: size.height * 0.05),
                _title(),
                SizedBox(height: size.height * 0.05),
                _lopezIcon(size),
                SizedBox(height: size.height * 0.05),
                _inputs(),
                SizedBox(height: size.height * 0.05),
                _loginButton(size),
                SizedBox(height: size.height * 0.05),
                _logupButton(),
                SizedBox(height: size.height * 0.05),
                _socialLoginButtons(),
              ],
            ))
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      'Lopez Store',
      style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 29, color: Resources().secondaryColor.withOpacity(0.9)),
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

  Widget _inputs() {
    final inputs = Column(
      children: [
        Input(
          icon: Icons.email,
          placeholder: 'Email',
          textController: _emailController,
          keyboardType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.none,
        ),
        Input(
          icon: Icons.fiber_pin,
          placeholder: 'Contraseña',
          textController: _passController,
          isPassword: true,
        )
      ],
    );

    return inputs;
  }

  _loginButton(Size size) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: MaterialButton(
        padding: EdgeInsets.symmetric(
            vertical: size.height * 0.025, horizontal: size.width * 0.2),
        onPressed: !_loading
            ? () async {
                _login();
              }
            : null,
        child:
            Text('Iniciar Sesion', style: GoogleFonts.montserrat(fontSize: 18, color: Resources().primaryColor, fontWeight: FontWeight.bold)),
        color: Resources().secondaryColor,
        textColor: Colors.white,
        splashColor: Resources().primaryColor,
      ),
    );
  }

  _login() {
    Navigator.of(context).pushReplacementNamed('main');
  }

  _logupButton() {
    return Container(
      child: GestureDetector(
        child: Text('¡Registrarme!',
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
}
/*decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Resources().primaryColor,
        Resources().primaryColor.withOpacity(0.9),
        Resources().primaryColor.withOpacity(0.8),
        Resources().primaryColor.withOpacity(0.7),
      ],
      stops: [0.1, 0.4, 0.7, 0.9],
    )),*/