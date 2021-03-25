import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:quiz_app/screens/welcome/welcome_screen.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';

class SelectArea extends StatelessWidget{
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 1), //2/6
                  Text(
                    "Lựa chọn chủ đề",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  Spacer(), // 1/6
                  InkWell(
                    onTap: () => Get.to(QuizScreen()),

                    child: Container(

                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.5), // 15
                      margin: EdgeInsets.only(left:60.0, right:60.0, top:40.0, bottom: 30.0),
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Hóa học",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      AlertDialog alert = AlertDialog(
                        title: Text('Chưa có câu hỏi nào'),
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },

                    child: Container(

                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.5), // 15
                      margin: EdgeInsets.only(left:60.0, right:60.0, top:40.0, bottom: 30.0),
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Vật lý",
                        style: Theme.of(context)
                            .textTheme
                            .button
                            .copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      AlertDialog alert = AlertDialog(
                        title: Text('Chưa có câu hỏi nào'),
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    },

                    child: Container(

                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.5), // 15
                      margin: EdgeInsets.only(left:60.0, right:60.0, top:40.0, bottom: 30.0),
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Lịch sử",
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
