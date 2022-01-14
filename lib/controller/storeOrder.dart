import 'package:flutter/widgets.dart';
import 'package:ganto_pawon/database.dart';

class StoreOrder extends ChangeNotifier{

Database database = Database();

String _namaPesanan;
String _gambarPesanan;
int _harga;
int _jumlahPesanan= 0;
bool _statePrice = false;
int _totalPesanan=0;
int _index=0;
List<Map<String,String>> _productItem= [];

set gambarPesanan(String value) => _gambarPesanan=value;
set namaPesanan (String value) => _namaPesanan = value;
set harga (int value) => _harga = value;
List<Map<String,String>> get productItem => _productItem;
get statePrice =>_statePrice;
get jumlahPesanan =>_jumlahPesanan;
get totalPesanan =>_totalPesanan;

  void addToMap (){
    _productItem.add({"namaPesanan":_namaPesanan.toString(),"hargaPesanan":_harga.toString(),"jumlahPesanan":_jumlahPesanan.toString(),"gambarPesanan":_gambarPesanan.toString()});
    _totalPesanan +=(int.parse(_productItem[_index]['hargaPesanan'])*int.parse(_productItem[_index]['jumlahPesanan']));
    // insert Database Pesanan
    int jumlahTotalPesanan = int.parse(_productItem[_index]['jumlahPesanan']) * int.parse(_productItem[_index]['hargaPesanan']); 
    database.insertPesanan(
    _productItem[_index]['namaPesanan'].toString(),
    _productItem[_index]['jumlahPesanan'], 
    _productItem[_index]['hargaPesanan'], 
    jumlahTotalPesanan);

    _index++;
    _jumlahPesanan =0;
    notifyListeners();
  }

   void showPrice(bool value){
    _statePrice = value;
    notifyListeners();
  }

void increment() {
    _jumlahPesanan++;
    notifyListeners();
  }
  void decrement() {
    if(_jumlahPesanan >= 1)
        _jumlahPesanan--;
      notifyListeners();
      if (_jumlahPesanan == 0){
        _jumlahPesanan = 0;
        notifyListeners();
      }
  }
  


void clear(){

_namaPesanan = '';
_gambarPesanan='';
harga =0;
_jumlahPesanan= 0;
_statePrice = false;
_totalPesanan=0;
_index=0;
 _productItem.clear();
}
}

