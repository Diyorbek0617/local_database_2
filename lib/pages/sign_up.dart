import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:local_database_2/model/account_model.dart';
import 'package:local_database_2/pages/sign_in.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({Key? key}) : super(key: key);
  static final String id = "sign_up";

  @override
  _Sign_upState createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  var email_controller = TextEditingController();
  var number_controller = TextEditingController();
  var address_controller = TextEditingController();
  _doSign_up(){
String email=email_controller.text.toString().trim();
String number=number_controller.text.toString().trim();
String address=address_controller.text.toString().trim();

var account=Account(email: email, number: number, address: address);

var  box=Hive.box("pdp online");
box.put("account", account.toJson());
var new_account=Account.fromJson(box.get("account"));
print(new_account.email);
print(new_account.number);
print(new_account.address);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: MediaQuery.of(context).size.width,
            color: Colors.teal,
            padding: EdgeInsets.all(30),
            margin: EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Welcome",
                  style: TextStyle(color: Colors.white38, fontSize: 12),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding:
                    EdgeInsets.only(left: 40, right: 40, top: 40, bottom: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextField(
                      controller: email_controller,
                      decoration: InputDecoration(
                        hintText: "User@gmail.com",
                        hintStyle:
                            TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Number",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextField(
                      controller: number_controller,
                      decoration: InputDecoration(
                        hintText: "000-126-9871",
                        hintStyle:
                            TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Address",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    TextField(
                      controller: address_controller,
                      decoration: InputDecoration(
                        hintText: "Golden Tower,Sylhet",
                        hintStyle:
                            TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: FlatButton(
                        onPressed: () {
                          _doSign_up();
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Center(
                        child: Text(
                      "OR",
                      style: TextStyle(color: Colors.black26),
                    )),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            child: Image.asset(
                              "assets/images/facebook.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            child: Image.asset(
                              "assets/images/twitter.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            height: 25,
                            width: 25,
                            child: Image.asset(
                              "assets/images/instagram.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(color: Colors.black26, fontSize: 13),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                  context, Sign_in.id);
                            },
                            child: Text(
                              "Sign In",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 13),
                            )),
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
