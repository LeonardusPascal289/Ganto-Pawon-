

import 'package:flutter/material.dart';
import 'package:ganto_pawon/controller/fetchUser.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:ganto_pawon/model/postResult.dart';


class Database extends ChangeNotifier{
final _key = new GlobalKey<FormState>();
String _name;
String _username;
String _password;
String _email;
String _notelp;

get userName =>_name;
get usernameUser =>_username;
get userEmail =>_email;
get key => _key;
set name (String value)=>  _name = value;
set username (String value){
  
  _username = value;
  notifyListeners();
  }
set password (String value)=>  _password = value;
set email (String value)=>  _email = value;
set notelp (String value)=>  _notelp = value;



  bool validateUserForm(){
    final form = _key.currentState;
    bool result = false;
    if (form.validate()){
      form.save();
      result = true;
    }
    return result;
  }


    userLogIn(BuildContext context )async{
    var url = "https://gantopawon.000webhostapp.com/gantoPawon/login.php";
    var response = await http.post(url,
    
    body: {
      'username' :_username,
      'password' :_password
    });




    if(response.statusCode == 200){
      var data=  json.decode(response.body) ;
    if(data['message']=="Success"){
       userInfo();
       Navigator.pushNamedAndRemoveUntil(context, 'HomeMenu', (route) => false);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Login Gagal, Input Kembali'),
          ),
        );
    }
      
    }
    else{
       ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Not Connected To Internet'),
          ),
        );

    }
    
  }

 


 // Register
  Future register(BuildContext context)async{
    
    var url = "https://gantopawon.000webhostapp.com/gantoPawon/register.php";
    var response = await http.post(url,
    body: {
       'name' :_name,
      'username' :_username,
      'password' :_password,
      'email' :_email,
      'telepon' :_notelp,
    });

    var data = json.decode(response.body);
    if(data['message']=="Success"){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.green,
            content: Text('Registrasi Berhasil'),
          ),
        );
      Navigator.pushNamedAndRemoveUntil(context, 'SignIn', (route) => false);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Registrasi Email/Username Telah Terdaftar, Input Kembali'),
          ),
        );
    }

  }



  // fetch Data 
    userInfo()async{
    var url = "https://gantopawon.000webhostapp.com/gantoPawon/fetch.php";
    var response = await http.post(url,
    body: {
      'username' :_username,
    });

    Map<String,dynamic> data =json.decode(response.body);
    _name = data['name'];
    _email = data['email'];
    notifyListeners();
  }
  
  Future<List> getCatgories(String value)async{
     var url = "https://gantopawon.000webhostapp.com/gantoPawon/$value.php";
    var response = await http.get(url);
    var result;
    if(response.statusCode == 200){
    var data  =json.decode(response.body);
    result = data;
    }

    else{
      print("Error");
    }
    return result;
  }

  Future<List> getPesanan()async{
     var url = "https://gantopawon.000webhostapp.com/gantoPawon/getpesanan.php";
    var response = await http.get(url);
    var result;
    if(response.statusCode == 200){
    var data  =json.decode(response.body);
    result = data;
    print(data);
    }

    else{
      print("Error");
    }
    return result;
  }


// INSERT PESANAN USER
insertPesanan(namaPesanan,jumlahPesanan,hargaPesanan,totalPesanan)async{
    var url = "https://gantopawon.000webhostapp.com/gantoPawon/insertPesanan.php";
    var response = await http.post(url,
    body: {
      'namaPesanan' :namaPesanan.toString(),
      'jumlahPesanan' :jumlahPesanan.toString(),
      'hargaPesanan' : hargaPesanan.toString(),
      'totalPesanan' : totalPesanan.toString(),
    });




    if(response.statusCode == 200){
      var data=  json.decode(response.body) ;
    if(data['message']=="Success"){
       print("Berhasil");
      //  Navigator.pushNamedAndRemoveUntil(context, 'HomeMenu', (route) => false);
    }
    else{
      print("Gagal");
      // ScaffoldMessenger.of(context).showSnackBar(
      //     const SnackBar(
      //       backgroundColor: Colors.red,
      //       content: Text('Login Gagal, Input Kembali'),
      //     ),
      //   );
    }
      
    }
    
  }



}