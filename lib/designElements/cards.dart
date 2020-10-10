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
            builder: (context) => QuizPage(difficulty: actualDifficulty, categoryId: categoryId,),
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
