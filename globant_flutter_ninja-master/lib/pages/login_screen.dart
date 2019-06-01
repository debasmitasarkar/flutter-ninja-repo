import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import './auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Auth auth = Auth();

  _buildLogoTextContainer() {
    return Container(
      padding: EdgeInsets.all(30.0),
      child: Text(
        'You need to sign in or create an account to continue',
        style: TextStyle(color: Colors.white, fontSize: 25.0),
      ),
    );
  }

  _buildGoogleSignInButton() {
    return RaisedButton(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(60.0)),
        child: Text(
          'Login with Google',
          style: TextStyle(fontSize: 18.0),
        ),
        onPressed: () {
          auth.handleSignIn().then((user) {
            print(user);
            auth.currentUser = user;
            Navigator.pushReplacementNamed(context, '/home');
          });
        });
  }

  _buildSignUpPageButton() {
    return FlatButton(
      onPressed: () {},
      child: Text(
        'More option',
        style: TextStyle(color: Colors.white, fontSize: 18.0),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
          margin: EdgeInsets.only(bottom: 40.0),
          child: Column(
            children: <Widget>[
              Spacer(flex: 1),
              _buildLogoTextContainer(),
              Spacer(flex: 1),
              _buildGoogleSignInButton(),
              SizedBox(
                height: 30.0,
              ),
              _buildSignUpPageButton(),
            ],
          )),
    );
  }
}
