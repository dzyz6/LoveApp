import 'package:flutter/material.dart';

class PublicProvider extends ChangeNotifier {
  String backimage='lib/common/image/cloud.jpeg';
  void changeimage(String path){
    backimage=path;
    notifyListeners();
  }
}