import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lopez_store_app/resources/resources.dart';

class Input extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;
  final bool readOnly;
  final Function onTap;
  final TextCapitalization textCapitalization;

  const Input(
      {Key key,
      @required this.icon,
      @required this.placeholder,
      @required this.textController,
      this.keyboardType = TextInputType.text,
      this.isPassword = false,
      this.readOnly = false,
      this.onTap,
      this.textCapitalization = TextCapitalization.sentences})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(5),
      margin: EdgeInsets.symmetric(
          vertical: size.height * 0.01, horizontal: size.width * 0.05),
      decoration: BoxDecoration(
          color: Resources().whiteColor.withOpacity(1),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Resources().secondaryColor.withOpacity(0.5),
                offset: Offset(2, 3))
          ]),
      child: _textFormField(),
    );
  }

  Widget _textFormField() {
    final textStyle = GoogleFonts.montserrat(color: Resources().secondaryColor);
    final textDecoration = InputDecoration(
          prefixIcon: Icon(this.icon, color: Resources().secondaryColor,),
          focusedBorder: InputBorder.none,
          border: InputBorder.none,
          hintText: this.placeholder,
          hintStyle: GoogleFonts.montserrat(color: Resources().secondaryColor),
    );

    return TextFormField(
      autocorrect: false,
      textCapitalization: this.textCapitalization,
      keyboardType: this.keyboardType,
      obscureText: this.isPassword,
      controller: this.textController,
      readOnly: this.readOnly,
      onTap: this.onTap,
      style: textStyle,
      decoration:  textDecoration
    );
  }
}
