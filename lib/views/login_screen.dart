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
            Resources().primaryColor.withOpacity(0.9),
            Resources().primaryColor.withOpacity(0.7),
            Resources().primaryColor.withOpacity(0.5),
            Resources().primaryColor.withOpacity(0.3),
          ],
          stops: [0.1, 0.4, 0.7, 0.9, 1],
        )
      ),
      padding: EdgeInsets.only(top: size.height * 0.0, bottom: size.height * 0.02),
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(bottom: size.height * 0.07, top: size.height * 0.07),
          
                child: Column(
              children: [
                _title(),
                SizedBox(height: size.height * 0.02),
                _lopezIcon(size),                
                SizedBox(height: size.height * 0.05),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(color: Resources().fontColor.withOpacity(0.0), borderRadius: BorderRadius.all(Radius.circular(10)) ),
                  child: Column(
                    children: [
                      Text(
                        'Iniciar Sesion', 
                        style: TextStyle(color: Resources().secondaryColor, fontWeight: FontWeight.w300, fontSize: 22),
                      ),
                  SizedBox(height: size.height * 0.02),
                  _inputs(),],
                  ),
                ),
                
                SizedBox(height: size.height * 0.05),
                _loginButton(size),
                SizedBox(height: size.height * 0.05),
                _logupButton(),
                SizedBox(height: size.height * 0.02),
                _socialLoginButtons(),
              ],
            )
          ,
        ),
      ),
    );
  }

  Widget _title() {
    return Text(
      'Lopez Store',
      style: TextStyle(fontSize: 30,  fontWeight: FontWeight.bold, color: Resources().fontColor)
      //GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 29, color: Resources().secondaryColor.withOpacity(0.9)),
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        boxShadow: [BoxShadow(
          color: Resources().secondaryColor,
          blurRadius: 0.7,
          offset: Offset(0.7 , 0.9),
          spreadRadius: 0.00000000
        )]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: MaterialButton(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.020, horizontal: size.width * 0.2),
          onPressed: !_loading
              ? () async {
                  _login();
                }
              : null,
          child:
              Text('Iniciar Sesion', style:TextStyle(color: Resources().secondaryColor, fontSize: 17, fontWeight: FontWeight.w700)),
          color: Resources().primaryColor,
          textColor: Colors.white,
          splashColor: Resources().secondaryColor,
        ),
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