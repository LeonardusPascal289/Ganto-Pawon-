import 'package:flutter/material.dart';
import 'package:ganto_pawon/controller/storeOrder.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CountItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context).settings.arguments as Map;
    int harga = int.parse(arguments['hargaFood']);
    String namaPesanan = arguments['namaFood'];
    String gambarPesanan = arguments['gambarFood'].toString();
    var sizeApp = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffEBE100),
      ),
      body: Consumer<StoreOrder>(
        builder: (_, stateChange, __) {
          return Column(
            children: [
              Container(
                height: sizeApp.height * 0.75,
                width: sizeApp.width,
                color: Colors.white,
                child: Column(
                  children: [
                    //Itemns Container
                    Container(
                      width: sizeApp.width,
                      height: sizeApp.height * 0.5,
                      decoration: BoxDecoration(
                          color: Color(0xffEBE100),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(3, 7),
                                color: Colors.black.withOpacity(0.4),
                                spreadRadius: 0.2,
                                blurRadius: 0.9)
                          ],
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(50))),
                      child: Column(
                        children: [
                          Text(
                            arguments['namaFood'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 300,
                            height: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image:
                                        AssetImage(gambarPesanan))),
                          ),
                          Text(
                            NumberFormat.currency(locale: 'id',symbol: 'Rp ', decimalDigits: 0)
                                .format(int.parse(arguments['hargaFood'])),
                            style: TextStyle(fontSize: 25),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 30),

                    // adding Removing Item
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              stateChange.decrement();
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xffEBE100)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(vertical: 15))),
                            child: Icon(Icons.remove)),
                        SizedBox(width: 30),
                        Text(
                          stateChange.jumlahPesanan.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        SizedBox(width: 30),
                        ElevatedButton(
                            onPressed: () {
                              stateChange.increment();
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(0xffEBE100)),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.symmetric(vertical: 15))),
                            child: Icon(Icons.add))
                      ],
                    )
                  ],
                ),
              ),
              // Submit Button
              ElevatedButton(
                  onPressed: () {
                    if(stateChange.jumlahPesanan!=0){
                    stateChange.gambarPesanan = gambarPesanan;
                    stateChange.harga  = harga;
                    stateChange.namaPesanan = namaPesanan;
                    stateChange.addToMap();
                    stateChange.showPrice(true);
                    
                    }
                   
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Color(0xffEBE100)),
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 15, horizontal: 125))),
                  child: Text('Submit'))
            ],
          );
        },
      ),
    );
  }
}
