import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:quiz_app/screens/area/select_area.dart';
import 'package:quiz_app/screens/register/register_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:quiz_app/models/Questions.dart';
import 'package:sweetalert/sweetalert.dart';

class WelcomeScreen extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance.reference();
  final _email = TextEditingController();
  final _password = TextEditingController();
  static String errorMessage = "";

  final chemistryCategory = getQuestionState("chemistry_state");
  final physicCategory = getQuestionState("physic_state");
  final historyCategory = getQuestionState("history_state");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(flex: 1), //2/6
                  Text(
                    "Quiz App",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 52),
                  ),
                  Spacer(), // 1/6
                  Container(
                    margin: EdgeInsets.all(10.0),
                    child: TextField(
                      key: Key("loginEmail"),
                      controller: _email,
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
                      key: Key("loginPassword"),
                      controller: _password,
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
                  InkWell(
                    onTap: () => login(context),

                    child: Container(

                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.5), // 15
                      margin: EdgeInsets.only(left:60.0, right:60.0, top:40.0, bottom: 30.0),
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Login",
                        key: Key("loginButton"),
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () =>Get.to(Register_Screen()),
                    child: Container(
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left:60.0, right:60.0),
                      child: Text("Don't have an account? Register here.",
                        key: Key("Go to Register"),
                        textAlign: TextAlign.center,
                        style:  Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.blueAccent, fontSize: 20, ),
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

  void login(BuildContext context) {
    if (_email.text == "") {
      errorMessage = "Email is not empty";
      SweetAlert.show(context, subtitle: "Email is not empty", style: SweetAlertStyle.error);
    }
    else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_email.text)) {
      SweetAlert.show(context, subtitle: "Email is invalid", style: SweetAlertStyle.error);
    }
    else if (_password.text == "") {
      SweetAlert.show(context, subtitle: "Password is not empty", style: SweetAlertStyle.error);
    }
    else {
      databaseReference.child("user_information").once().then((DataSnapshot snapshot) {
        if(snapshot.value["email"] == _email.text && snapshot.value["password"] == _password.text) {
          Navigator.pushAndRemoveUntil<dynamic>(
            context,
            MaterialPageRoute<dynamic>(
              builder: (BuildContext context) => SelectArea(),
            ),
            (route) => false,
          );
        }
        else {
          errorMessage = "Invalid username or password";
          SweetAlert.show(context, subtitle: errorMessage, style: SweetAlertStyle.error);
        }
      });
      errorMessage = "Invalid username or password";
    }
  }
}
