

import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';


class Toastmassage{

static SuccessToast(msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor:Colors.green,
      textColor: Colors.white,
      fontSize: 16.0,
      webPosition: "center"

  );
}

static ErrorToast(error) {
  Fluttertoast.showToast(
      msg: error.toString(),
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
      webPosition: "center"

  );
}

static GeneralToast(msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.purple,
      textColor: Colors.white,
      fontSize: 16.0,
      webPosition: "center"

  );
}}