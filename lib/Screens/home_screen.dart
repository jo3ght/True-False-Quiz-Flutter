import 'package:flutter/material.dart';
import 'package:review_1/Logic/QuizBrian.dart';
import 'package:review_1/Model/Question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
//test update

QuizBrian _quizBrian = QuizBrian();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

bool correctAnswer;

class _HomeScreenState extends State<HomeScreen> {
  int score = 0;
  int life = 3;
  var indexOfQuestion = 0;

  void reset() {
    setState(() {
      _quizBrian.resetQuiz();
      score = 0;
      life = 3;
    });
  }

  void checkQuestion(bool userPicked) {
    setState(() {
      if (userPicked == correctAnswer) {
        setState(() {
          score++;
        });
      } else if (userPicked != correctAnswer) {
        setState(() {
          life--;
          if (life == 0) {
            Alert(
              context: context,
              type: AlertType.error,
              title: "Fail !",
              desc: "You are dead",
              buttons: [
                DialogButton(
                  child: Text(
                    "Play again",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.pop(context),
                  color: Color.fromRGBO(0, 179, 134, 1.0),
                ),
              ],
            ).show();
            setState(() {
              reset();
            });
          }
        });
      }
      if (_quizBrian.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Done !",
          desc: "You got $score points",
          buttons: [
            DialogButton(
              child: Text(
                "Play again",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Color.fromRGBO(0, 179, 134, 1.0),
            ),
          ],
        ).show();
        setState(() {
          reset();
        });
      }
      _quizBrian.nextQuestion();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Your score: $score"),
                Text("Your life: $life"),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    _quizBrian.getQuestion(),
                    style: TextStyle(fontSize: 30),
                  ),
                ),
                SizedBox(height: 350),
                MaterialButton(
                  child: Text(
                    "True",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  padding: const EdgeInsets.all(10.0),
                  minWidth: 200,
                  height: 60,
                  color: Colors.green,
                  onPressed: () {
                    setState(() {
                      correctAnswer = _quizBrian.getAnswer();
                      checkQuestion(true);
                    });
                  },
                ),
                SizedBox(height: 26),
                MaterialButton(
                  child: Text(
                    "False",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  minWidth: 200,
                  height: 60,
                  color: Colors.red,
                  onPressed: () {
                    correctAnswer = _quizBrian.getAnswer();
                    checkQuestion(false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
