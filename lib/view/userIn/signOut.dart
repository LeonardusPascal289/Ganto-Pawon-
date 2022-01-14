import 'package:flutter/material.dart';


import 'package:ganto_pawon/database.dart';
import 'package:provider/provider.dart';


class SignOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: 
    Scaffold(
       appBar: AppBar(title: Text("Profile"),backgroundColor: Color(0xffEBE100),),
      body: Column(
        children: [
          Card(
            elevation: 3,
            child: Consumer<Database>(
              builder: (__,userInfo,_){

                return ListTile(
                contentPadding: EdgeInsets.all(40),
                leading: CircleAvatar(child:Icon(Icons.person)),
                title: Text(userInfo.userName.toString()),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Username : " + userInfo.usernameUser.toString()),
                    Text("Email : "+ userInfo.userEmail.toString())
                  ],
                ),
                trailing:  ElevatedButton(onPressed: ()async{
                 
              Navigator.pushNamedAndRemoveUntil(context, 'WelcomePage', (route) => false);
          }, child: Text("Sign Out")),
              );
              },  
            )
          ),

         
        ],
      ),
    ));
  }
}