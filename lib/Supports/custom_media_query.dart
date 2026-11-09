


import 'package:flutter/material.dart';

class CustomMediaQuery {


  static double customWidget(BuildContext context){
    return  MediaQuery.of(context).size.width;
  }

  static double customHeight(BuildContext context){
    return  MediaQuery.of(context).size.height;
  }



}