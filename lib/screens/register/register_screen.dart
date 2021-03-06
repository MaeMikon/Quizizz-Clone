import 'package:flutter/material.dart';
import 'package:quiz_app/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:sweetalert/sweetalert.dart';

class Register_Screen extends StatelessWidget {

  final databaseReference = FirebaseDatabase.instance.reference();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confirmedPassword = TextEditingController();
  static String errorMessage = "";
  static bool registerResult = false;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.cover),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 1), //2/6
                  Text(
                    "Create Account",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 48),
                  ),
                  Spacer(), // 1/6
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: TextField(
                      key: Key("Username"),
                      controller: username,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF1C2341),
                        hintText: "UserName",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: TextField(
                      key: Key("Email"),
                      controller: email,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF1C2341),
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      key: Key("Password"),
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xFF1C2341),
                        hintText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                      ),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        key: Key("ConfirmPassword"),
                        controller: confirmedPassword,
                        obscureText: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFF1C2341),
                          hintText: "Confirm Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(12)),
                          )
                        ),
                      ),
                  ),
                  InkWell(
                    onTap: () => createAccount(context),

                    child: Container(

                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.5), // 15
                      margin: EdgeInsets.only(left:60.0, right:60.0, top:40.0, bottom: 30.0),
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Create Account",
                        key: Key("registerButton"),
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String createAccount(BuildContext context) {
    if(username.text == "") {
      errorMessage = "Username is not empty";
      SweetAlert.show(context, subtitle: errorMessage, style: SweetAlertStyle.error);
    }
    else if (email.text == "") {
      errorMessage = "Email is not empty";
      SweetAlert.show(context, subtitle: errorMessage, style: SweetAlertStyle.error);
    }
    else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email.text)) {
      errorMessage = "Email is invalid";
      SweetAlert.show(context, subtitle: errorMessage, style: SweetAlertStyle.error);
    }
    else if (password.text == "") {
      errorMessage = "Password is not empty";
      SweetAlert.show(context, subtitle: errorMessage, style: SweetAlertStyle.error);
    }
    else if (confirmedPassword.text == "") {
      errorMessage = "Confirm Password is not empty";
      SweetAlert.show(context, subtitle: errorMessage, style: SweetAlertStyle.error);
    }
    else if(password.text != confirmedPassword.text) {
      errorMessage = "Confirm Password do not match";
      SweetAlert.show(context, subtitle: errorMessage, style: SweetAlertStyle.error);
    }
    else {
      errorMessage = null;
      databaseReference.child("user_information").set({
        'username': username.text,
        'email': email.text,
        'password': password.text
      });
      registerResult = true;
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => WelcomeScreen(),
        ),
        (route) => false,
      );
    }

    return null;
  } 
}




