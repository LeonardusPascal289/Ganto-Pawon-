import 'package:flutter/material.dart';


class Payment with ChangeNotifier{
  int _count = 0;
  bool _statePrice = false;
  bool _stateTransfer = false;
  Color _transferColor = Colors.white;
   Color _tunaiColor = Colors.white;

  Color get transfersColor=>_transferColor;
  Color get tunaiColor=>_tunaiColor;
  bool get stateTransfer => _stateTransfer;
  bool get statePrice =>_statePrice;
  int get count => _count;

   void showTransfer(bool value){
     if (value){
       _transferColor = Colors.yellow ;
       _tunaiColor = Colors.white;
       notifyListeners();

     }
     else{
       _tunaiColor = Colors.yellow;
       _transferColor = Colors.white;
       notifyListeners();
     }
    _stateTransfer = value;
    notifyListeners();
  }
  void increment() {
    _count++;
    notifyListeners();
  }
  void decrement() {
    _count--;
    notifyListeners();
  }
}