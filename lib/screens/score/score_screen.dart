import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:quiz_app/screens/area/select_area.dart';
import 'package:flutter/widgets.dart';

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
          ),
          InkWell(
            onTap: () => {
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => SelectArea(),
                ),
                (route) => false,
              )
            },

            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(kDefaultPadding * 0.5), // 15
              margin: EdgeInsets.only(left:60.0, right:60.0, top:480.0, bottom: 100.0),
              decoration: BoxDecoration(
                gradient: kPrimaryGradient,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Text(
                "Come Back",
                style: Theme.of(context)
                    .textTheme
                    .button
                    .copyWith(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
