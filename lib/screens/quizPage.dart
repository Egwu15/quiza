import 'package:flutter/material.dart';
import 'package:fun_quiz/designElements/colors.dart';
import 'package:fun_quiz/models/quizModel.dart';
import 'package:fun_quiz/services/quizCall.dart';
import 'package:fun_quiz/designElements/cards.dart';
import 'package:fun_quiz/services/quizbrain.dart';

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

  Future<QuizModel> futureQuizModel;

  _QuizPageState({this.categoryId, this.difficulty});
  @override
  void initState() {
    super.initState();
    futureQuizModel = fetchQuiz(difficulty: difficulty, categoryId: categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: FutureBuilder(
            future: futureQuizModel,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                int index = scorebrain.showCurrentQuestion();
                List answers = [];
                answers.add(snapshot.data.results[index].incorrectAnswers[0]);
                answers.add(snapshot.data.results[index].incorrectAnswers[1]);
                answers.add(snapshot.data.results[index].incorrectAnswers[2]);
                answers.add(snapshot.data.results[index].correctAnswer);
                answers.shuffle();
                print(snapshot.data.results[index].correctAnswer);
                return Column(
                  children: [
                    Text(scorebrain.showscore().toString()),
                    questionCard(
                      snapshot.data.results[index].question.toString(),
                    ),
                    optionsCard(
                        cardText: answers[0],
                        answerFunction: () {
                          setState(() {
                            scorebrain.checkScore(
                                snapshot.data.results[index].correctAnswer,
                                answers[0]);
                          });
                        }),
                    optionsCard(
                        cardText: answers[1],
                        answerFunction: () {
                          setState(() {
                            scorebrain.checkScore(
                                snapshot.data.results[index].correctAnswer,
                                answers[1]);
                          });
                        }),
                    optionsCard(
                        cardText: answers[2],
                        answerFunction: () {
                          setState(() {
                            scorebrain.checkScore(
                                snapshot.data.results[index].correctAnswer,
                                answers[2]);
                          });
                        }),
                    optionsCard(
                        cardText: answers[3],
                        answerFunction: () {
                          setState(() {
                            scorebrain.checkScore(
                                snapshot.data.results[index].correctAnswer,
                                answers[3]);
                          });
                        }),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
