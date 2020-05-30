import 'package:flutter/material.dart';

import 'controllers/dataHelper.dart';
import 'signin_page.dart';

class Login_page extends StatefulWidget {
  @override
  _Login_pageState createState() => _Login_pageState();
}

const orangeX = const Color(0xFFf9657f);

class _Login_pageState extends State<Login_page> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  DataHelper dataHelper = new DataHelper();

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
          dataHelper.signup(emailController.text, passwordController.text, usernameController.text);
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
              "Sign up ",
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
              child: Text("Sign up with Google"),
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.72,
                  minHeight: 50.0),
            ),
            onPressed: null,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0))));
  }

  Widget _showEmailInput() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      padding: const EdgeInsets.fromLTRB(42.0, 20.0, 42.0, 0.0),
      child: new TextFormField(
        controller: emailController,
        maxLines: 1,
        keyboardType: TextInputType.emailAddress,
        autofocus: false,
        decoration: new InputDecoration(
          hintText: 'Email',
        ),
      ),
    );
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
                    top: MediaQuery.of(context).size.height * 0.2),
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
              "Sign up for other ",
              style: TextStyle(color: Color(0xFFB6BBCC), fontSize: 16),
            ),
            Text(
              "features",
              style: TextStyle(
                  color: Color(0xFFB6BBCC), height: 1.5, fontSize: 16),
            ),
            _showAddressInput(),
            _showPasswordInput(),
            _showEmailInput(),
            _showLoginButton(),
            _showGoogleButton(),
            Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.15),
                child: Text(
                  "Do you already have an account?",
                  style: TextStyle(color: Color(0xFFB6BBCC)),
                )),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Signin_page()),
                );
              },
              child: Text(
                "Sign in",
                style: TextStyle(color: orangeX),
              ),
            )
          ],
        ),
      )),
    );
  }
}
