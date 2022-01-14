import 'package:flutter/material.dart';
import '../customWidget.dart';


class OrderProgress extends StatefulWidget {


  @override
  _OrderProgressState createState() => _OrderProgressState();
}

class _OrderProgressState extends State<OrderProgress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(backgroundColor: Colors.white,elevation: 0,iconTheme: IconThemeData(color: Colors.black),),
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Image.asset('images/FoodToss.png'),
             ProgressTile(title: "Order Diterima",progress: true,progressTileColor: Colors.white,progressTileTextColor: Colors.black,),
             ProgressTile(title: "Sedang Dimasak",progress: false,progressTileColor: Colors.yellow,progressTileTextColor: Colors.black,),
             ProgressTile(title: "Selesai dan Menuju Alamat",progress: false,progressTileColor: Colors.white,progressTileTextColor: Colors.black,),
           ],
         ),
       ),
    );
  }
}

