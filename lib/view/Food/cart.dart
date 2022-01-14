import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ganto_pawon/database.dart';
import 'package:provider/provider.dart';


class Cart extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<Database>(
        builder: (_,database,__){
          return  Scaffold(
        appBar: AppBar(title: Text("Cart"),backgroundColor: Color(0xffEBE100),),
        body: FutureBuilder(
          future: database.getPesanan(),
          builder: (__,snapshot){
          return snapshot.hasData
                    ? PesananCart(
                        data: snapshot.data,
                      )
                    : Center(child: Text("Tidak Ada"));
        })
      );
        },
      
    );
  }
}

class PesananCart extends StatelessWidget {
  final List data;
  PesananCart({this.data});

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: (){
            Navigator.pushNamed(context, 'OrderProgress');
          },
              child: Card(
          elevation: 3,
          child: ListTile(
            contentPadding: EdgeInsets.all(40),
            leading: CircleAvatar(child:Icon(Icons.food_bank)),
            title: Text("Order #1",style: TextStyle(fontSize: 20),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(data.length, (index) {
                return Column(
                  children: [
                Text(data[index]['namapesanan'].toString()),
               
                  ],
                );
              },
               
              ),
            ),
            trailing: Icon(Icons.blur_circular)
          )
        ),
    );
  }
}