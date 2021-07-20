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
      //  decoration: BoxDecoration(
      //      color: Colors.transparent,
      //      borderRadius: BorderRadius.circular(30),
      //      border: Border.all(color: Resources().fontColor)
      //      //boxShadow: [
      //      //  BoxShadow(
      //      //      color: Resources().secondaryColor.withOpacity(0.5),
      //      //      offset: Offset(2, 3))
      //      //]
      //      ),
      child: _textFormField(),
    );
  }

  Widget _textFormField() {
    final textStyle = TextStyle(color: Resources().secondaryColor, fontWeight: FontWeight.w300);
    final textDecoration = InputDecoration(
      prefixIcon: Icon(
        this.icon,
        color: Resources().fontColor,
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(40)),
          borderSide: BorderSide(color: Resources().secondaryColor)),
      hintText: this.placeholder,
      hintStyle: textStyle,
    );

    return Theme(
        data: ThemeData(
            primaryColor: Resources().primaryColor,
            accentColor: Resources().secondaryColor),
        child: TextFormField(
            autocorrect: false,
            textCapitalization: this.textCapitalization,
            keyboardType: this.keyboardType,
            obscureText: this.isPassword,
            controller: this.textController,
            readOnly: this.readOnly,
            onTap: this.onTap,
            style: textStyle,
            decoration: textDecoration));
  }
}
