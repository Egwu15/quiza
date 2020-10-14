import 'package:flutter/material.dart';
import 'package:fun_quiz/designElements/colors.dart';
import 'package:fun_quiz/models/quizModel.dart';
import 'package:fun_quiz/services/quizCall.dart';
import 'package:fun_quiz/designElements/cards.dart';
import 'package:fun_quiz/services/quizbrain.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class QuizPage extends StatefulWidget {
  final String categoryId;
  final String difficulty;
  QuizPage({this.categoryId, this.difficulty});
  @override
  _QuizPageState createState() =>
      _QuizPageState(categoryId: this.categoryId, difficulty: this.difficulty);
}

class _QuizPageState extends State<QuizPage> {
  final String categoryId;
  final String difficulty;
  var scorebrain = Scorebrain();
  List answers = [];

  Future<QuizModel> futureQuizModel;

  _QuizPageState({this.categoryId, this.difficulty});
  @override
  void initState() {
    super.initState();
    futureQuizModel = fetchQuiz(difficulty: difficulty, categoryId: categoryId);
    answers.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    Timer(Duration(minutes: 30), () {});

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Consumer<Scorebrain>(
            builder: (context, scorebrain, child) => FutureBuilder(
              future: futureQuizModel,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  int index = scorebrain.showCurrentQuestion();
                  answers = [];
                  answers.add(snapshot.data.results[index].incorrectAnswers[0]);
                  answers.add(snapshot.data.results[index].incorrectAnswers[1]);
                  answers.add(snapshot.data.results[index].incorrectAnswers[2]);
                  answers.add(snapshot.data.results[index].correctAnswer);
                  
                  print(snapshot.data.results[index].correctAnswer);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          scoreCircle(
                              'Score: ' + scorebrain.showscore().toString()),
                          lives(scorebrain.getLives())
                          , Text(scorebrain.remainingTime().toString())
                        ],
                      ),
                      questionCard(
                        snapshot.data.results[index].question.toString(),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      optionsCard(
                          cardText: answers[0],
                          answerFunction: () {
                            scorebrain.checkScore(
                                snapshot.data.results[index].correctAnswer,
                                answers[0],
                                context);
                          }),
                      optionsCard(
                          cardText: answers[1],
                          answerFunction: () {
                            scorebrain.checkScore(
                                snapshot.data.results[index].correctAnswer,
                                answers[1],
                                context);
                          }),
                      optionsCard(
                          cardText: answers[2],
                          answerFunction: () {
                            scorebrain.checkScore(
                                snapshot.data.results[index].correctAnswer,
                                answers[2],
                                context);
                          }),
                      optionsCard(
                          cardText: answers[3],
                          answerFunction: () {
                            scorebrain.checkScore(
                                snapshot.data.results[index].correctAnswer,
                                answers[3],
                                context);
                          }),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                  //TODO: make dedicated error page.
                }

                // By default, show a loading spinner.
                return CircularProgressIndicator();
              },
            ),
          ),
        ),
      ),
    );
  }
}
