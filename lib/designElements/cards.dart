import 'package:flutter/material.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:fun_quiz/screens/difficulty.dart';
import 'colors.dart';

AnimatedPadding homepageCard(
    {BuildContext context, String category, int categoryId}) {
  return AnimatedPadding(
    duration: Duration(seconds: 2),
    padding: const EdgeInsets.all(15.0),
    curve: Curves.easeIn,
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DifficultyPage(),
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

AnimatedPadding difficultyCard(String difficulty) {
  return AnimatedPadding(
    duration: Duration(seconds: 2),
    padding: const EdgeInsets.all(15.0),
    curve: Curves.easeIn,
    child: InkWell(
      child: ClayContainer(
        spread: 2.0,
        color: homepageCardColor,
        borderRadius: 8.0,
        curveType: CurveType.concave,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            difficulty,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: "karla"),
          ),
        ),
      ),
    ),
  );
}
