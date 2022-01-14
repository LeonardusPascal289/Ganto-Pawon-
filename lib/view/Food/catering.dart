import 'package:flutter/material.dart';
import '../customWidget.dart';



class Catering extends StatefulWidget {

  @override
  _CateringState createState() => _CateringState();
}

class _CateringState extends State<Catering> {
  bool result=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Visibility(
        visible: (result)??false,
        child:TransactionOption(title:"Total Pembayaran Anda Adalah Rp. 40.000",onPressed: (){
          Navigator.pushNamed(context, "PembayaranNormal");
        },color: Color(0xff49B615))),
        appBar: AppBar(
          backgroundColor: Color(0xffEBE100),
          title: Text('Catering')),
        body: GridView.builder(
          padding: EdgeInsets.all(10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (__, index) {
              return InkWell(
                onTap: (){
                  Navigator.pushNamed(context, 'CountItem');
                  setState(() {
                  result = true;
                  });
                  
                   
                },
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/FoodSample.png'),
                      Text(
                        'Ayam Goreng Khas Ganto Pawon',
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              );
            }));
  }
}