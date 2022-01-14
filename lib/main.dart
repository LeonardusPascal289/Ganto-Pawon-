import 'package:flutter/material.dart';
import 'package:ganto_pawon/controller/payment.dart';
import 'package:ganto_pawon/controller/something.dart';
import 'package:ganto_pawon/controller/storeOrder.dart';
import 'package:ganto_pawon/database.dart';
import 'package:ganto_pawon/view/Food/orderProgress.dart';
import 'package:ganto_pawon/view/transaction/succesful.dart';

import 'package:provider/provider.dart';
import 'package:ganto_pawon/view/transaction/countItem.dart';
import 'package:ganto_pawon/view/Food/food.dart';
import 'package:ganto_pawon/view/userIn/welcomePage.dart';
import 'package:ganto_pawon/view/userIn/signUp.dart';
import 'package:ganto_pawon/view/userIn/userSignIn.dart';
import 'package:ganto_pawon/view/Food/homeMenu.dart';
import 'package:ganto_pawon/view/transaction/pembayaranNormal.dart';
import 'package:ganto_pawon/view/Food/drinks.dart';
import 'package:ganto_pawon/view/Food/catering.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<Payment> (create: (_)=>Payment()),
      ChangeNotifierProvider<Something> (create: (_)=>Something()),
      ChangeNotifierProvider<Database>(create: (_)=> Database()),
      ChangeNotifierProvider<StoreOrder>(create: (_)=> StoreOrder())
    ],
    child:MyApp())
    );
    
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),

      routes: {
        'WelcomePage': (context) => WelcomePage(),
        'SignUp' : (context) => SignUp(),
        'SignIn' :(context) =>UserSignIn(),
        'HomeMenu' :(context) =>HomeMenu(),
        'Food': (context) => Food(),
        'Drinks': (context)=> Drinks(),
        'Catering': (context)=> Catering(),
        'CountItem': (context)=> CountItem(),
        'PembayaranNormal': (context)=> PembayaranNormal(),
        'Succesful' : (context)=> Succesful(),
        'OrderProgress' :(context) => OrderProgress(),
        
       
      },
      
    );
  }
}