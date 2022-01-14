import 'package:flutter/material.dart';
import '../customWidget.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    var sizeApp = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Image.asset('images/background.png',
              width: sizeApp.width, height: sizeApp.height, fit: BoxFit.cover),
          Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text(
            'Ganto \nPawon',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
          Text('Makanan Khas Surabaya dengan \ncita rasa sedap dan gurih',
              style: TextStyle(color: Colors.white),             
          )
              ],
            ),
          ),


          // SIGN IN SIGN UP
          Positioned(
            bottom: 100,
            left: 30,
            child: 
               CustomSignButton(title: 'Sign In',onPressed: (){
                 Navigator.pushNamed(context, 'SignIn');
               },),
            ),
             Positioned(
            bottom: 40,
            left: 30,
            child: 
               CustomSignButton(title: 'Sign Up',onPressed: (){
                 Navigator.pushNamed(context, 'SignUp');
               },),
            )
         

          
        ],
      ),
    ));
  }
}

