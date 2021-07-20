import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sweetalert/sweetalert.dart';

class Resources {
////////////////Colors//////////////////////////
  ///Color.fromRGBO(217, 4, 160, 1); //PINK COLOR #D904A0
  ///Color.fromRGBO(104, 63, 191, 1); //VIOLETE #683FBF
  ///Color.fromRGBO(242, 242, 242, 1); //WHITE #F2F2F2
  ///Color.fromRGBO(242, 135, 5, 1); //ORANGE YELLOW #F28705
  ///Color.fromRGBO(242, 114, 68, 1); //ORANGE PINK #F27244
  ///Color.fromRGBO(7, 46, 64, 1); // BLUE GREEN #012E40
  ///
  ///

  Color primaryColor = Color.fromRGBO(1, 66, 106, 1);
  Color accentColor = Color.fromRGBO(224, 62, 82, 1);
  Color secondaryColor = Color.fromRGBO(255, 143, 28, 1);
  Color accentColorYellow = Color.fromRGBO(7, 46, 64, 1);
  Color accentColorPink = Color.fromRGBO(217, 4, 80, 1);
  Color whiteColor = Color.fromRGBO(242, 242, 242, 1);
  Color fontColor = Color.fromRGBO(255, 143, 28, 1);

  /////////////////////////////////A todo color pallete///////////////////////////////////////
  ///Color accentColor = Color.fromRBGO(217, 4, 160, 1); //pink color
  ///Color primaryColor = Color.fromRBGO(217, 4, 160, 1);
  ///
  ///
  ///
  ///
  ///
  ///
  ///

  String getFecha() {
    return DateFormat('dd/MM/yyyy hh:mm:ss a').format(DateTime.now());
  }

  showMessageSuccess(BuildContext context, String titulo, Function callback,
      [String subtitulo, bool returnTrue = false]) {
    SweetAlert.show(context,
        title: titulo,
        subtitle: subtitulo,
        style: SweetAlertStyle.success, onPress: (confirmar) {
      if (confirmar) {
        callback();
        return returnTrue ? true : false;
      }
      return false; //Mantener el Dialog
    });
  }

  showMessageError(BuildContext context, String titulo) {
    SweetAlert.show(context, title: titulo, style: SweetAlertStyle.error);
  }

  showMessageConfirmar(BuildContext context, Function callback,
      [String titulo,
      String subtitulo,
      String cancelText = 'No',
      String confirmText = 'Si']) {
    SweetAlert.show(context,
        title: titulo,
        subtitle: subtitulo,
        style: SweetAlertStyle.confirm,
        showCancelButton: true,
        cancelButtonText: cancelText,
        confirmButtonText: confirmText, onPress: (confirmar) {
      if (confirmar) {
        callback();
      } else {
        return true;
      }
      return false; //Mantener el Dialog
    });
  }

  mostrarDialog(
      Widget widget, BuildContext context, double width, double height) {
    final dialog = Dialog(
      child: Container(width: width, height: height, child: widget),
      insetAnimationCurve: Curves.easeIn,
      insetAnimationDuration: Duration(milliseconds: 500),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    );
    showDialog(context: context, builder: (_) => dialog);
  }

  showMessageConfirmarDireccion(
      BuildContext context,
      String titulo,
      String subtitulo,
      String cancelText,
      String confirmText,
      Function callbackContinuar) {
    SweetAlert.show(context,
        title: titulo,
        subtitle: subtitulo,
        style: SweetAlertStyle.confirm,
        showCancelButton: true,
        cancelButtonText: cancelText,
        confirmButtonText: confirmText, onPress: (confirmar) {
      if (confirmar) {
        callbackContinuar();
      } else {
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed('administrar_direccion');
      }
      return false;
    });
  }
}
