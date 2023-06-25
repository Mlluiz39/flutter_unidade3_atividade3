import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin Mensagem {
  void showMessage(String msg, BuildContext context) {
    Fluttertoast.showToast(
      msg: 'Operação cancelada',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.orangeAccent,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }
}
