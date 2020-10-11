import 'dart:convert';

import "package:http/http.dart" as http;
import 'package:fun_quiz/models/quizModel.dart';

Future<QuizModel> fetchQuiz({String difficulty, String categoryId}) async {
  var url =
      'https://opentdb.com/api.php?amount=10&category=$categoryId&difficulty=$difficulty&type=multiple';
  final response = await http.get(url);
  if (response.statusCode == 200) {
    print('reponse 200!');
    return QuizModel.fromJson(json.decode(response.body.replaceAll("&#039;", "'").replaceAll('&quot;', "''")));
    
  } else {
    throw Exception('failed to load');
  }
}

int questionNumber = 0;