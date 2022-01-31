// ignore_for_file: unnecessary_this

import 'package:flutter/material.dart';

class ShoeModel extends ChangeNotifier {
  String _assetImage = 'assets/imgs/azul.png';
  double _talla = 7.0;

  String get assetImage => _assetImage;
  set assetImage(String image) {
    this._assetImage = image;
    notifyListeners();
  }

  double get talla => _talla;
  set talla(double talla) {
    this._talla = talla;
    notifyListeners();
  }
}
