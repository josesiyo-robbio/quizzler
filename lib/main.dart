


import 'package:flutter/material.dart';
import 'package:quizzler/providers/quizBrain.dart';
import 'package:quizzler/widgets/alertWidget.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());



class Quizzler extends StatelessWidget
{
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}



class QuizPage extends StatefulWidget
{
  @override
  _QuizPageState createState() => _QuizPageState();
}



class _QuizPageState extends State<QuizPage>
{
  List<Widget> scoreKeeper = [];

  Future<void> checkAnswer(bool userAnswer, BuildContext context) async
  {
    setState(()
    {
      bool correctAnswer = quizBrain.getQuestionAnswer();

      if (userAnswer == correctAnswer)
      {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(Icon(Icons.close, color: Colors.red));
      }
    });

    bool nextQuestionAvailable = quizBrain.nextQuestion();

    if (nextQuestionAvailable)
    {
      await messageFinish(context);
      quizBrain.resetApp();
      scoreKeeper.clear();
    }
  }


  @override
  Widget build(BuildContext context)
  {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[

        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20.0,
                ),
              ),
              onPressed: ()
              {
                checkAnswer(true,context);
              },
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: ElevatedButton(

              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red,
                ),
              ),
              onPressed: () {
                checkAnswer(false,context);

              },
            ),
          ),
        ),

        Row(children: scoreKeeper,)
      ],
    );
  }
}

