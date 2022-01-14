class InfoUser{
String id;
String name;
String username;
String password;
String email;
String notelp;

InfoUser({this.id,this.name,this.username,this.email,this.notelp,this.password});


 createUserInfo(Map<String,dynamic> object){
  return InfoUser (
    id: object['id'],
    name: object['name'],
    username : object ['username'],
    password : object ['userpassword'],
    notelp:object ['notelpon']
    );
}




}