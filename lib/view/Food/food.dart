import 'package:flutter/material.dart';
import 'package:ganto_pawon/controller/storeOrder.dart';
import 'package:ganto_pawon/database.dart';
import 'package:ganto_pawon/model/sizeConfig.dart';
import 'package:ganto_pawon/view/customWidget.dart';
import 'package:provider/provider.dart';

class Food extends StatefulWidget {
  @override
  _FoodState createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return Consumer2<StoreOrder, Database>(
        builder: (context, stateChange, database, __) {
      return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Visibility(
              visible: (stateChange.statePrice) ? true : false,
              child: TransactionOption(
                  title: "Total Pembayaran Anda Adalah Rp."+stateChange.totalPesanan.toString(),
                  onPressed: () {
                    print(stateChange.productItem);
                
                    Navigator.pushNamed(context, "PembayaranNormal");
                  },
                  color: Color(0xff49B615))),
          appBar:
              AppBar(backgroundColor: Color(0xffEBE100), title: Text('Food')),
          body: FutureBuilder(
              future: database.getCatgories("food"),
              builder: (__,snapshot) {
                return snapshot.hasData
                    ? FoodGrid(
                        data: snapshot.data,
                      )
                    : Center(child: CircularProgressIndicator());
              }));
    });
  }
}

class FoodGrid extends StatelessWidget {
  final List data;
  FoodGrid({this.data});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GridView.builder(
        itemCount: (data != null) ? data.length : 0,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
        itemBuilder: (__, index) {
          return InkWell(
            
            onTap: () {

              Navigator.pushNamed(context, 'CountItem', arguments: {
                'namaFood': data[index]['namafood'],
                'hargaFood': data[index]['hargafood'],
                'gambarFood': "images/Foods/"+data[index]['gambarfood'].toString()
              });
            },
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width:SizeConfig.sizeBlockWidth *75,
                    height: SizeConfig.sizeBlockHeight*15,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/Foods/'+data[index]['gambarfood'].toString()),
                        fit: BoxFit.fill
                      )
                    ),
                  ),
                  Text(
                    data[index]['namafood'].toString(),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          );
        });
  }
}
