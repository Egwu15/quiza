class Scorebrain {
  int _score = 0;
  int _currentQuestion = 0;

  void increaseScore() {
    _score++;
  }

  int showscore() {
    return _score;
  }

  void checkScore(correctAnswer, selectedAnswer){
    if(correctAnswer == selectedAnswer){
      _score++;
      _currentQuestion++;
    }
    else
    {
      _currentQuestion++;
    }
  }
  int showCurrentQuestion(){
    return _currentQuestion;
  }
}
