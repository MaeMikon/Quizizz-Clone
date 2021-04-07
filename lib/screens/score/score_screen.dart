import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          WebsafeSvg.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Score",
                style: TextStyle(fontSize: 82)
              ),
              Text(
                "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: kSecondaryColor),
              ),
              if (_qnController.numOfCorrectAns/_qnController.questions.length >= 0.9)
              Text(
                  "Excellent!",
                  style: TextStyle(fontSize: 60)
              )
              else if (_qnController.numOfCorrectAns/_qnController.questions.length >= 0.8)
                Text(
                    "Good",
                    style: TextStyle(fontSize: 60)
                )
              else if (_qnController.numOfCorrectAns/_qnController.questions.length >= 0.5)
                  Text(
                      "Not bad",
                      style: TextStyle(fontSize: 60)
                  )
                else
                    Text(
                        "Try harder",
                        style: TextStyle(fontSize: 60)
                    )
            ],
          )
        ],
      ),
    );
  }
}
