import 'package:flutter/material.dart';
import 'package:ganto_pawon/database.dart';



class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
   Database signUp = Database();

  
  @override
  Widget build(BuildContext context) {
    var sizeApp = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Center(child: Text(' Sign Up')),),
      body: Stack(
        children: [
          Image.asset('images/background.png',
              width: sizeApp.width, height: sizeApp.height, fit: BoxFit.cover),
              Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text('Sign Up',style:TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold)),
                Container(
                  padding: EdgeInsets.all(20),
                  width: sizeApp.width * 0.9,
                  height: sizeApp.width*0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  
                    
                    color: Colors.white),
                child: Form(
                    key: signUp.key,
                      child: SingleChildScrollView(
                                              child: Column(
                    children: [
                        // Name
                      TextFormField(
                        validator: (e){
                          if(e.isEmpty){
                            return "Masukan nama";
                          } 
                        },
                        onSaved: (e)=>signUp.name = e,
                        obscureText: false,
                        decoration: InputDecoration(
                            labelStyle: TextStyle(color: Colors.black),
                            labelText: 'Nama'),
                      ),
                      SizedBox(height: 10),

                      // username
                        TextFormField(
                          validator: (e){
                            if(e.isEmpty){
                              return "Masukan Username";
                            } 
                          },
                          onSaved: (e)=>signUp.username = e,
                          obscureText: false,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Username'),
                        ),
                        
                        // password
                        TextFormField(
                          validator: (e){
                            if(e.isEmpty){
                              return "Masukan Password";
                            } 
                          },
                          onSaved: (e)=>signUp.password = e,
                          obscureText: true,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Password'),
                        ),
                        SizedBox(height: 10),

                          // password
                        TextFormField(
                          validator: (e){
                            if(e.isEmpty){
                              return "Masukan Email";
                            } 
                          },
                          onSaved: (e)=>signUp.email = e,
                          obscureText: false,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'Email'),
                        ),
                        SizedBox(height: 10),


                          // password
                        TextFormField(
                          validator: (e){
                            if(e.isEmpty){
                              return "Masukan notelpon";
                            } 
                          },
                          onSaved: (e)=>signUp.notelp= e,
                          obscureText: false,
                          decoration: InputDecoration(
                              labelStyle: TextStyle(color: Colors.black),
                              labelText: 'No Telpon'),
                        ),
                        SizedBox(height: 10),


                        // button
                        ElevatedButton(
                          onPressed: () {
                            if (signUp.validateUserForm()) {
                                signUp.register(context);
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
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xffEBE100)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 50))),
                        )
                    ],
                  ),
                      )
                  ),
                  )
               
              ],),)
      
        ])
    );
  }
}