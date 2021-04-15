import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:quiz_app/constants.dart';
import 'package:quiz_app/screens/quiz/quiz_screen.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:quiz_app/models/Questions.dart';

class SelectArea extends StatelessWidget {
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
                  Spacer(), //2/6
                  Align(
                    alignment: Alignment.center,
                    child:
                    Text("Quizz App", style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 52),
                    ),
                  ),

                  InkWell(
                    onTap: () async => {
                      await getList("chemistry"),
                      Get.to(QuizScreen())
                    },
                    child:
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: EdgeInsets.all(15), // 15
                      margin: EdgeInsets.only(left:30.0, right:30.0, top:20.0, bottom: 20.0),
                      decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                        children: <Widget>[
                          Text("Hóa học", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 32)),
                          new LinearPercentIndicator(
                            width: 300,
                            animation: true,
                            lineHeight: 25.0,
                            animationDuration: 2000,
                            percent: chemistry_category["correct_answer"] / chemistry_category["question"],
                            center: Text("${(chemistry_category["correct_answer"] * 100 / chemistry_category["question"]).toInt()}%"),
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: Colors.greenAccent,
                          ),
                          Text("${chemistry_category["correct_answer"]}/${chemistry_category["question"]} câu hỏi đã hoàn thành", style: TextStyle(color: Colors.black, fontSize: 18),),
                        ],
                      )
                  ),
              ),

                  InkWell(
                    onTap: () async => {
                      await getList("physic"),
                      Get.to(QuizScreen())
                    },

                    child:
                    Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.all(15), // 15
                        margin: EdgeInsets.only(left:30.0, right:30.0, top:20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: <Widget>[
                            Text("Vật lý", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 32)),
                            new LinearPercentIndicator(
                              width: 300,
                              animation: true,
                              lineHeight: 25.0,
                              animationDuration: 2000,
                              percent: physic_category["correct_answer"] / physic_category["question"],
                              center: Text("${(physic_category["correct_answer"] * 100 / physic_category["question"]).toInt()}%"),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.greenAccent,
                            ),
                            Text("${physic_category["correct_answer"]}/${physic_category["question"]} câu hỏi đã hoàn thành", style: TextStyle(color: Colors.black, fontSize: 18),),
                          ],
                        )
                    ),
                  ),

                  InkWell(
                    onTap: () async => {
                      await getList("history"),
                      Get.to(QuizScreen())
                    },

                    child:
                    Container(
                        alignment: Alignment.bottomLeft,
                        padding: EdgeInsets.all(15), // 15
                        margin: EdgeInsets.only(left:30.0, right:30.0, top:20.0, bottom: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: <Widget>[
                            Text("Lịch sử", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 32)),
                            new LinearPercentIndicator(
                              width: 300,
                              animation: true,
                              lineHeight: 25.0,
                              animationDuration: 2000,
                              percent: history_category["correct_answer"] / history_category["question"],
                              center: Text("${(history_category["correct_answer"] * 100 / history_category["question"]).toInt()}%"),
                              linearStrokeCap: LinearStrokeCap.roundAll,
                              progressColor: Colors.greenAccent,
                            ),
                            Text("${history_category["correct_answer"]}/${history_category["question"]} câu hỏi đã hoàn thành", style: TextStyle(color: Colors.black, fontSize: 18),),
                          ],
                        )
                    ),
                  ),
                  Spacer(flex: 1), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
