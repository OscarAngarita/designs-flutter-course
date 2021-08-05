// import 'package:flutter/material.dart';

import 'package:flutter/foundation.dart';

class SliderModel with ChangeNotifier{

  double _currentPage = 0;

  double get currentPage => this._currentPage;

  set currentPage(double currentPage){
    this._currentPage = currentPage;
    notifyListeners(); //Notifica a los widgets que les interese el cambio de este valor
  }

}