import 'dart:async';

import 'package:flutter/foundation.dart';

class Scorebrain extends ChangeNotifier {
  int _score = 0;
  int _currentQuestion = 0;
  int _maxQuestion = 10;
  List _lives = [1, 1, 1, 1];
  Timer _timer;
  int _start = 30;

  void increaseScore() {
    _score++;
    notifyListeners();
  }

  int showscore() {
    return _score;
  }

  void checkScore(correctAnswer, selectedAnswer, context) {
    if (correctAnswer == selectedAnswer) {
      _score++;
      _currentQuestion++;
      
    } else {
      removeLife();
      _currentQuestion++;
      startTimer();
    }
    notifyListeners();
  }

  int showCurrentQuestion() {
    return _currentQuestion;
  }

  List getLives() {
    return _lives;
  }

  void removeLife() {
    if (_lives.length == 1) {
      print('gameOver');
    } else {
      _lives.removeLast();
    }
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start < 1) {
          timer.cancel();
          notifyListeners();
        } else {
          _start = _start - 1;
          notifyListeners();
        }
      },
    );
  }

  int remainingTime() {
    return _start;
  }
}
// void starttimer() async {
//     const onesec = Duration(seconds: 1);
//     Timer.periodic(onesec, (Timer t) {
//       setState(() {
//         if (timer < 1) {
//           t.cancel();
//           nextquestion();
//         } else if (canceltimer == true) {
//           t.cancel();
//         } else {
//           timer = timer - 1;
//         }
//         showtimer = timer.toString();
//       });
//     });
//   }
