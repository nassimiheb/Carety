import 'dart:io';

import 'package:carety/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'controllers/dataHelper.dart';

class Signin_page extends StatefulWidget {
  @override
  _Signin_pageState createState() => _Signin_pageState();
}

const orangeX = const Color(0xFFF9657F);

class _Signin_pageState extends State<Signin_page> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  String token="test";
    DataHelper dataHelper = new DataHelper();



   void login(String username,String password) async {
  

    String myUrl = "https://carety.herokuapp.com/login";
    http.post(myUrl,
    headers: {HttpHeaders.authorizationHeader:""},
        body: {
         "email" : "$username",
         "password" :"$password",
        }).then((response){
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
      setState(() {
        if(response.statusCode==200){

           token= response.body.split(":")[1].split("\"")[1];
            Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SlidingCardsView(token: token,)),
                      );
           }
       
      });

    });
    
  }
  Widget _showAddressInput() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      padding: const EdgeInsets.fromLTRB(42.0, 20.0, 42.0, 0.0),
      child: new TextFormField(
        controller: usernameController,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        obscureText: false,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Username',
        ),
      ),
    );
  }

  Widget _showPasswordInput() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      padding: const EdgeInsets.fromLTRB(42.0, 20.0, 42.0, 0.0),
      child: new TextFormField(
        controller: passwordController,
        maxLines: 1,
        obscureText: true,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Password',
        ),
      ),
    );
  }

  Widget _showLoginButton() {
    return Container(
      margin: EdgeInsets.fromLTRB(
          0.0, MediaQuery.of(context).size.height * 0.06, 0.0, 0.0),
      height: 40.0,
      child: RaisedButton(
        onPressed: () {
           login(usernameController.text, passwordController.text);
              
           
           
        },
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFDF2430), Color(0xFFDF2430)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(30.0)),
          child: Container(
            constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.8,
                minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              "Sign in",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget _showGoogleButton() {
    return Container(
        margin: EdgeInsets.fromLTRB(
            0.0, MediaQuery.of(context).size.height * 0.02, 0.0, 0.0),
        height: 40.0,
        child: OutlineButton(
          
            child: Container(
              alignment: Alignment.center,
              child: Text("Sign in with Google"),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.72,
                  minHeight: 50.0),
            ),
            onPressed:(){
               print(this.token);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.height * 0.2,
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
                child: Image.asset('assets/applogo.jpg')),
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.05),
              child: Text(
                "Welcome to Carety",
                style: TextStyle(
                  color: orangeX,
                  fontSize: 18,
                ),
              ),
            ),
            Text(
              "Sign up for other",
              style: TextStyle(color: Color(0xFFB6BBCC), fontSize: 16),
            ),
            Text(
              "features",
              style: TextStyle(
                  color: Color(0xFFB6BBCC), height: 1.5, fontSize: 16),
            ),
            _showAddressInput(),
            _showPasswordInput(),
            Align(
              child: Container(
                child: Text('Fergot password',
                    style: TextStyle(
                      color: orangeX,
                      decoration: TextDecoration.underline,
                    )),
                margin: EdgeInsets.fromLTRB(0.0, 4.0, 42.0, 0.0),
              ),
              alignment: Alignment.centerRight,
            ),
            _showLoginButton(),
            _showGoogleButton(),
            Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.2),
                child: Text(
                  "Do you already have an account?",
                  style: TextStyle(color: Color(0xFFB6BBCC)),
                )),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "Sign up now !",
                style: TextStyle(color: orangeX),
              ),
            )
          ],
        ),
      )),
    );
  }
}
