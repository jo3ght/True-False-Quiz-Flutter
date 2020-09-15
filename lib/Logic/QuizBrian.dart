import 'package:review_1/Model/Question.dart';

class QuizBrian {
  int _questionNumber = 0;
  List<Question> questionList = [
    Question("A woman has walked on the moon", false),
    Question("Goldfish only have a memory of three seconds", false),
    Question("Stephen Hawking declined a knighthood from the Queen", true),
    Question("The highest mountain in England is Ben Nevis", false),
    Question("The Great Wall of China is visible from space", false),
    Question("The first tea bags were made of silk", true),
    Question("The Statue of Liberty was a gift from France", true),
  ];

  String getQuestion() {
    return questionList[_questionNumber].questionText;
  }

  void nextQuestion() {
    if (_questionNumber < questionList.length - 1) {
      _questionNumber++;
    }
  }

  bool isFinished() {
    if (_questionNumber >= questionList.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  bool getAnswer() {
    return questionList[_questionNumber].answer;
  }

  void resetQuiz() {
    _questionNumber = 0;
  }
}
