import 'package:flutter/material.dart';
import 'package:fun_quiz/designElements/colors.dart';
import 'package:fun_quiz/designElements/cards.dart';

class DifficultyPage extends StatelessWidget {
  const DifficultyPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: backgroundColor,
          body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, 
        children: [
            difficultyCard('Still sucking my fingers'),
            difficultyCard('Been here before'),
            difficultyCard('All hail the king'),
        ],
      ),
          ),
    );
  }
}