import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fun_quiz/designElements/colors.dart';
import 'package:fun_quiz/designElements/cards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DifficultyPage extends StatelessWidget {
  final String categoryId;
  const DifficultyPage({Key key, this.categoryId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pick difficulty",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: 'Karla',
              ),
            ),
            difficultyCard(
                difficulty: 'Still sucking my fingers',
                icon: FontAwesomeIcons.babyCarriage,
                context: context,
                actualDifficulty: "easy",
                categoryId: categoryId),
            difficultyCard(
                difficulty: 'Been here before',
                icon: FontAwesomeIcons.solidMehRollingEyes,
                context: context,
                actualDifficulty: "medium",
                categoryId: categoryId),
            difficultyCard(
                difficulty: 'All hail the king',
                icon: FontAwesomeIcons.meteor,
                context: context,
                actualDifficulty: "hard",
                categoryId: categoryId),
          ],
        ),
      ),
    );
  }
}
