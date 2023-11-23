import 'package:flutter/material.dart';


class FocusNodes{
  static void fieldFocus(BuildContext context, FocusNode currentFocus, FocusNode nextFocus){
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}