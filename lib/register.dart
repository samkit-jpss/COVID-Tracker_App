import 'package:covid19/Animation/FadeAnimation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              child: Stack(
                children: [
                  Positioned(
                    height: 400,
                    width: width,
                    child: FadeAnimation(
                      1,
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/login.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeAnimation(
                    1.5,
                    Text(
                      "Login",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.indigo[200],
                            blurRadius: 10,
                            offset: Offset(0, 10))
                      ],
                    ),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                          1.6,
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom:
                                        BorderSide(color: Colors.grey[200]))),
                            child: TextField(
                             
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Username",
                                  hintStyle: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        ),
                        FadeAnimation(
                            1.7,
                            Container(
                              padding: EdgeInsets.all(10),
                              child: TextField(
                                
                                obscureText: true,
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Password",
                                    hintStyle: TextStyle(color: Colors.grey)),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FadeAnimation(
                    1.8,
                    Center(
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  FadeAnimation(
                    1.9,
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 60),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.indigo,
                        ),
                        child: FlatButton(
                         onPressed: () {
                           Navigator.pushNamed(context, "/home");
                         },
                          child: Center(
                              child: Text(
                            "Login",
                            style: TextStyle(color: Colors.white),
                          )),
                        )),
                  ),
                  SizedBox(height: 20),
                  FadeAnimation(
                    2.0,
                    Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
