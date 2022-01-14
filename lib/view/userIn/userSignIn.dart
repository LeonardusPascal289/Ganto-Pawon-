import 'package:ganto_pawon/database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserSignIn extends StatefulWidget {
  @override
  _UserSignInState createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
  Database login = Database();

  @override
  Widget build(BuildContext context) {
    var sizeApp = MediaQuery.of(context).size;
    return Consumer<Database>(
            builder: (__,login,_) {
              return   Scaffold(
          appBar: AppBar(
            title: Center(child: Text(' Sign In')),
          ),
          body: Stack(children: [
            Image.asset('images/background.png',
                width: sizeApp.width, height: sizeApp.height, fit: BoxFit.cover),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Sign In',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold)),
                  Container(
                    padding: EdgeInsets.all(20),
                    width: sizeApp.width * 0.9,
                    height: sizeApp.width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: Form(
                        key: login.key,
                        child: Column(
                          children: [
                            TextFormField(
                              validator: (e) {
                                if (e.isEmpty) {
                                  return "Masukan Username";
                                }
                              },
                              onSaved: (e) => login.username = e.toString(),
                              obscureText: false,
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.black),
                                  labelText: 'Username'),
                            ),

                            // password
                            TextFormField(
                              validator: (e) {
                                if (e.isEmpty) {
                                  return "Masukan Password";
                                }
                              },
                              onSaved: (e) => login.password = e,
                              obscureText: true,
                              decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.black),
                                  labelText: 'Password'),
                            ),
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () {
                                if (login.validateUserForm()) {
                                  login.userLogIn(context);
                                } else {
                                  print("failed");
                                }

                                //  Navigator.pushNamed(context, 'HomeMenu');
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(fontSize: 20),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xffEBE100)),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                  padding: MaterialStateProperty.all(
                                      EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 50))),
                            )
                          ],
                        )),
                  )
                ],
              ),
            )
          ]));
            },
    );
  }
}
