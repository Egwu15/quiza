import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:fun_quiz/screens/difficulty.dart';
import 'package:fun_quiz/screens/quizPage.dart';
import 'colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

AnimatedPadding homepageCard(
    {BuildContext context, String category, String categoryId}) {
  return AnimatedPadding(
    duration: Duration(seconds: 2),
    padding: const EdgeInsets.all(15.0),
    curve: Curves.easeIn,
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DifficultyPage(
              categoryId: categoryId,
            ),
          ),
        );
      },
      child: ClayContainer(
        spread: 2.0,
        color: homepageCardColor,
        borderRadius: 8.0,
        curveType: CurveType.concave,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            category,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: "karla"),
          ),
        ),
      ),
    ),
  );
}

AnimatedPadding difficultyCard(
    {String difficulty,
    IconData icon,
    String actualDifficulty,
    String categoryId,
    BuildContext context}) {
  return AnimatedPadding(
    duration: Duration(seconds: 2),
    padding: const EdgeInsets.all(15.0),
    curve: Curves.easeIn,
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizPage(
              difficulty: actualDifficulty,
              categoryId: categoryId,
            ),
          ),
        );
      },
      child: ClayContainer(
        spread: 2.0,
        color: homepageCardColor,
        borderRadius: 8.0,
        curveType: CurveType.concave,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: IntrinsicHeight(
            child: Row(
              children: [
                FaIcon(
                  icon,
                  color: Colors.white,
                  size: 40.0,
                ),
                SizedBox(width: 10.0),
                VerticalDivider(
                  thickness: 2.0,
                  color: Colors.white,
                ),
                SizedBox(width: 10.0),
                Text(
                  difficulty,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontFamily: "karla",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

AnimatedPadding optionsCard(
    {BuildContext context,
    String correctAnswer,
    String cardText,
    Function answerFunction}) {
  return AnimatedPadding(
    duration: Duration(seconds: 2),
    padding: const EdgeInsets.all(10.0),
    curve: Curves.easeIn,
    child: InkWell(
      onTap: answerFunction,
      child: ClayContainer(
        spread: 2.0,
        color: backgroundColor,
        borderRadius: 8.0,
        // curveType: CurveType.concave,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            cardText,
            style: TextStyle(
                fontSize: 18.0, color: Colors.white, fontFamily: "karla"),
          ),
        ),
      ),
    ),
  );
}

Padding questionCard(question) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClayContainer(
      borderRadius: 8.0,
      depth: 15,
      color: backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          question,
          style: TextStyle(
              fontSize: 18.0, color: Colors.white, fontFamily: "karla"),
        ),
      ),
    ),
  );
}

Padding scoreCircle(score) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ClayContainer(
      color: backgroundColor,
      curveType: CurveType.concave,
      borderRadius: 20,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          score,
          style: TextStyle(fontSize: 13.0, color: Colors.white, fontFamily: "karla"),
        ),
      ),
    ),
  );
}

Widget lives(List livesLeft) {
  List<Widget> liveList = [];
  for (var i in livesLeft) {
    liveList.add(Padding(
      padding: const EdgeInsets.all(4.0),
      child: FaIcon(
        FontAwesomeIcons.heartBroken,
        color: Colors.white,
      ),
    ));
    
  }
  return ClayContainer(
      color: backgroundColor,
      curveType: CurveType.concave,
      borderRadius: 20,
      child: Row(
        children: liveList,
      ));
}
