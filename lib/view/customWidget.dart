import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomSignButton extends StatelessWidget {
  CustomSignButton({this.onPressed,this.title});
  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed,child: Text(title,style: TextStyle(fontSize: 20),),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Color(0xffEBE100)),
      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
      padding:MaterialStateProperty.all(EdgeInsets.symmetric(vertical:15,horizontal:150))),);
  }
}

class CategoryButton extends StatelessWidget {
  CategoryButton({this.onPressed,this.image,this.title});
  final Function onPressed;
  final String image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding:MaterialStateProperty.all(EdgeInsets.symmetric(vertical: 15,horizontal: 20)),
        backgroundColor: MaterialStateProperty.all(Colors.white)
      ),
        child: Center(child: 
      Column(children: [
        Image.asset('images/$image'),
        SizedBox(height:5),
        Text('$title',style: TextStyle(color: Colors.black),)
      ],),));
  }
}


// submit Pay Button 
class SubmitPay extends StatelessWidget {
  SubmitPay ({this.total,this.onpressed});
  final int total;
  final Function onpressed;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
          Text("Total",style: TextStyle(fontSize:20,fontWeight:FontWeight.w400)),
          Text(NumberFormat.currency(locale:'id',symbol:"Rp ",decimalDigits: 0).format(total),style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),)
        ],),
        ElevatedButton(onPressed: onpressed,style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Color(0xff49B615)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
             padding:MaterialStateProperty.all(EdgeInsets.symmetric(vertical:15,horizontal:100)),
        ), child: Text("Pesan"))
      ],
    );
  }
}

class PesananUser extends StatelessWidget {
  const PesananUser({
    @required this.mediaQuery,
    this.gambarPesanan = "FoodSample.png",
    this.namaPesanan,
    this.jumlahPesanan,
    this.hargaPesanan,
    this.totalPesanan ,
  });

  final String gambarPesanan;
  final String namaPesanan;
  final int jumlahPesanan;
  final int hargaPesanan;
  final int totalPesanan;
  final Size mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: mediaQuery.width *0.90,
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15)
        ),
        elevation:4,
        child:Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             //  name order
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(gambarPesanan),
                    fit:BoxFit.fill
                  )
                ),
                
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Text(namaPesanan,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                  Text("$jumlahPesanan x " + NumberFormat.currency(locale:'id',symbol: 'Rp ',decimalDigits: 0).format(hargaPesanan)),
                  Text("Total = " + NumberFormat.currency(locale:'id',symbol: 'Rp ',decimalDigits: 0).format(jumlahPesanan * hargaPesanan) ),
                ]
              )
            ],
            
          ),
        )
      ),
    );
  }
}

// highlight Text

class HighlightText extends StatelessWidget {

HighlightText({this.title});
final String title;

  @override
  Widget build(BuildContext context) {
    return Container(width:150,height:30,decoration: BoxDecoration(
      color:Colors.yellow,
      borderRadius:BorderRadius.circular(5)
    )
    ,child:Center(child: Text(title,style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.left,)));
  }
}

// Pesanan USER
class AlamatUser extends StatelessWidget {
  const AlamatUser({
    Key key,
    @required this.mediaQuery,
  }) : super(key: key);

  final Size mediaQuery;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: mediaQuery.width *0.90,
        height: 75,
        child: Card(
          elevation:4 ,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(20),
        hintStyle: TextStyle(color: Colors.grey,),
        hintText: 'Masukan Alamat',
        enabledBorder: InputBorder.none
        ),
        
        
          ),
        ));
  }
}

// transaction Button
class TransactionOption extends StatelessWidget {
  final Color color ;
  final String title; 
  final Function onPressed;

  TransactionOption({this.title,this.onPressed,this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(5),
          backgroundColor: MaterialStateProperty.all(color),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10))),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(
                  vertical: 15, horizontal: 50)),
        ),
        child: Text(title,style: TextStyle(color:Colors.black.withOpacity(0.75),)));
  }
}


//  ProgressTile
class ProgressTile extends StatelessWidget {
  ProgressTile({this.progress,this.progressTileColor,this.progressTileTextColor,this.title});
  final bool progress ;
  final Color progressTileColor ;
  final Color progressTileTextColor ;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5 ,
         child: ListTile(
           tileColor: progressTileColor,
         leading: Checkbox(
           value: progress,
           onChanged: (value){},
           activeColor: Colors.green,
           ),
        title: Center(child: Text(title,style: TextStyle(color:progressTileTextColor,fontSize:20,fontWeight: FontWeight.w500),)),
      ),
    );
  }
}