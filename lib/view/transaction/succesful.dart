import 'package:flutter/material.dart';
import 'package:ganto_pawon/controller/payment.dart';
import 'package:ganto_pawon/controller/storeOrder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';



class Succesful extends StatefulWidget {

  @override
  _SuccesfulState createState() => _SuccesfulState();
}

class _SuccesfulState extends State<Succesful> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StoreOrder>(
      builder: (_,succesful,__){
        return    Scaffold(
        backgroundColor:Color(0xffEBE100) ,
        body: Center(child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.check,size: 200,color: Colors.green,),
            Text("PEMESANAN BERHASIL",style: TextStyle(fontSize: 20),),
            Text(NumberFormat.currency(locale:'id',decimalDigits: 0,symbol: "Rp. ").format(succesful.totalPesanan) ,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            Column(children: List.generate(succesful.productItem.length, (index) {
                return Column(children: [
                    Text(succesful.productItem[index]['jumlahPesanan'].toString() +" X " +succesful.productItem[index]['namaPesanan'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                ],);
            }),),
           
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 10,horizontal: 50))
              ),
              onPressed: (){
                succesful.clear();
              Navigator.pushNamedAndRemoveUntil(context, "HomeMenu", (route) => false);
            }, child: Text("Back To Home",style: TextStyle(color: Colors.black,),))

            
          ],
        ),)
      );
      }
      
    );
  }
}