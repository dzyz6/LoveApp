

import 'package:flutter/material.dart';
import 'package:untitled5/view/addimage.dart';

class QRoute{
  static String addimage='/addimage';
  static final Map<String, Widget Function(dynamic arguments)> routers ={
    addimage:(_)=>Addimage(),
  };
}