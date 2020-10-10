import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fun_quiz/models/quizModel.dart';
import 'package:fun_quiz/networkCalls/quizCall.dart';

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
          body: Center(
            child: FutureBuilder(
        future: futureQuizModel,
        builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.results[1].question.toString());
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
        },
      ),
          ),
    );
  }
}
