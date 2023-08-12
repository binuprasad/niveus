
import 'package:flutter/material.dart';

class Appcontants {
  static const h10 =  SizedBox(
    height: 10,
  );
  static const h20 = SizedBox(
    height: 20,
  );
static  height(context) {
    return MediaQuery.of(context).size.height;
  }

 static width(context) {
    return MediaQuery.of(context).size.width;
  }
}