import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';

class Register_Screen extends StatelessWidget{
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
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
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "Email address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10.0),
                  child: TextField(
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
                  padding: EdgeInsets.all(10.0),

                  child: TextField(
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
                  onTap: () => Get.to(WelcomeScreen()),

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
                      style: Theme.of(context)
                          .textTheme
                          .button
                          .copyWith(color: Colors.black),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Get.to(WelcomeScreen()),

                  child: Container(

                    alignment: Alignment.center,
                    padding: EdgeInsets.all(kDefaultPadding * 0.5), // 15
                    margin: EdgeInsets.only(left:60.0, right:60.0, top:40.0, bottom: 30.0),
                    decoration: BoxDecoration(
                      gradient: kPrimaryGradient,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text(
                      "I Have an Account",
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
}


