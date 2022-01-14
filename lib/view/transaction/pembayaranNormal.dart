import 'package:flutter/material.dart';
import 'package:ganto_pawon/controller/storeOrder.dart';
import 'package:provider/provider.dart';
import 'package:ganto_pawon/controller/payment.dart';
import '../customWidget.dart';

class PembayaranNormal extends StatefulWidget {
  @override
  _PembayaranNormalState createState() => _PembayaranNormalState();
}

class _PembayaranNormalState extends State<PembayaranNormal> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Consumer<StoreOrder>(

        builder:(_,payment,__){
          return  Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "Pesanan",
                style: TextStyle(color: Colors.black),
              ),
              iconTheme: IconThemeData(color: Colors.black)),
          body: Consumer<Payment>(
            builder: (_, statePayment, __) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                      flex: 6,
                      child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            // Pesanan User
                            SizedBox(height: 20),
                            HighlightText(
                              title: "Keranjang",
                            ),
                            Column(children: 
                            List.generate(payment.productItem.length, (index){
                              return PesananUser(
                              gambarPesanan: payment.productItem[index]['gambarPesanan'],
                              mediaQuery: mediaQuery,
                              namaPesanan: payment.productItem[index]['namaPesanan'],
                              jumlahPesanan: int.parse(payment.productItem[index]['jumlahPesanan']),
                              hargaPesanan: int.parse(payment.productItem[index]['hargaPesanan']),
                            );
                            })
                            ,),


                             
                            // Alamat
                            SizedBox(height: 20),
                            HighlightText(
                              title: "Alamat Pengantaran",
                            ),
                            AlamatUser(mediaQuery: mediaQuery),

                            SizedBox(height: 20),
                            // Pembayaran
                            HighlightText(
                              title: "Pembayaran Via ",
                            ),
                            Container(
                                width: mediaQuery.width * 0.90,
                                height: 75,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    TransactionOption(
                                      color: statePayment.transfersColor,
                                      title: "Transfer",
                                      onPressed: () {
                                        statePayment.showTransfer(true);
                                      },
                                    ),
                                    TransactionOption(
                                      title: "Tunai",
                                      onPressed: () {
                                        statePayment.showTransfer(false);
                                      },
                                      color: statePayment.tunaiColor
                                    )
                                  ],
                                )),

                              Visibility(visible:(statePayment.stateTransfer)??false,
                              child:Container(
                                child: Column (
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                     HighlightText(title: "BuktiPembayaran",),
                                    Container(
                                      width: 125,height: 110,
                                    
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                     color: Colors.black.withOpacity(0.25),
                                    blurRadius: 5,
                                    spreadRadius: 5,)
                                        ]
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(20),
                                        child:ElevatedButton(
                                          onPressed: (){},
                                          child: Text("Upload"),
                                        )
                                      )
                                    )
                                  ],
                                ),
                              )),
                              SizedBox(height:20)
                            

                            // end of Column
                          ]))),
                  Expanded(
                      flex: 2,
                      child: Container(
                          padding: EdgeInsets.all(40),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.vertical(top: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.25),
                                    blurRadius: 5,
                                    spreadRadius: 5,
                                    offset: Offset(1, -4))
                              ]),
                          width: mediaQuery.width,
                          child: Center(
                              child: SubmitPay(
                                total: payment.totalPesanan,
                              
                            onpressed: () {
                              Navigator.pushNamed(context, "Succesful");
                            },
                          ))))
                ],
              );
            },
          ));
        }

         
    );
  }
}
