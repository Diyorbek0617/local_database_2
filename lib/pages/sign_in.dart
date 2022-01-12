import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:local_database_2/model/user_model.dart';
import 'package:local_database_2/pages/sign_up.dart';

class Sign_in extends StatefulWidget {
  const Sign_in({Key? key}) : super(key: key);
 static final String id="sign_in";

  @override
  _Sign_inState createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {

  var email_controller = TextEditingController();
  var password_controller = TextEditingController();
  _doSign_in(){
    String email=email_controller.text.toString().trim();
    String password=password_controller.text.toString().trim();

    var user=User(email: email, password: password);

    var  box=Hive.box("pdp online");

    box.put("user",user.toJson());
   var new_user= User.fromJson(box.get("user"));

   print(email_controller.text.toString());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Colors.teal,
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/man_fon.jpg",),
                  radius: 20,
                ),
                SizedBox(height: 20,),
                Text("Welcome",style: TextStyle(color: Colors.white38,fontSize: 12),),
                SizedBox(height: 8,),
                Text("Sign In",style: TextStyle(color: Colors.white70,fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(left: 40,right: 40,top: 40,bottom: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25),),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email",style: TextStyle(color: Colors.black,fontSize: 16),),
                    TextField(
                      controller: email_controller,
                      decoration: InputDecoration(
                        hintText: "User@gmail.com",
                        hintStyle: TextStyle(color: Colors.black87),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text("Password",style: TextStyle(color: Colors.black,fontSize: 16),),
                    TextField(
                      controller: password_controller,
                      decoration: InputDecoration(
                      hintText: "Enter Password",
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 11),
                    ),),
                    SizedBox(height: 30,),
                    Center(child: Text("Forgot Password?",style: TextStyle(color: Colors.black26,fontSize: 14),)),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                    decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: FlatButton(
                      onPressed: (){
                        _doSign_in();
                      },
                      child: Text("Sign In",style: TextStyle(color: Colors.white,fontSize: 18),),
                    ),
                    ),
                    SizedBox(height: 20,),
                    Center(child: Text("OR",style: TextStyle(color: Colors.black26),)),
                    SizedBox(height: 40,),
                    Container(
                      padding: EdgeInsets.only(left: 20,right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            child: Image.asset("assets/images/facebook.png",fit: BoxFit.cover,),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            child: Image.asset("assets/images/twitter.png",fit: BoxFit.cover,),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            child: Image.asset("assets/images/instagram.png",fit: BoxFit.cover,),
                          ),
                        ],
                      ),),
                    SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",style: TextStyle(color: Colors.black26,fontSize: 13),),
                        SizedBox(width: 8,),
                        GestureDetector(
                            onTap: (){
                              Navigator.pushReplacementNamed(context, Sign_up.id);
                            },
                            child: Text("Sign Up",style: TextStyle(color: Colors.blue,fontSize: 13),)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
