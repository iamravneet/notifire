import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Functions{


  static Future? toastMsg(String msg,){
    Fluttertoast.showToast(
        msg:msg,
        toastLength:
        Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}