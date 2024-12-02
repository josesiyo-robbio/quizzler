import 'package:flutter/material.dart';
import 'package:quizzler/providers/question.dart';
import 'package:quizzler/providers/quizBrain.dart';

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
                bool correctAnswer = quizBrain.getQuestionAnswer();
                quizBrain.nextQuestion();
                if(correctAnswer ==  true )
                {

                }
                else
                {

                }
                setState(()
                {

                  scoreKeeper.add(
                    Icon(
                      Icons.check,
                      color: Colors.green,
                    )

                  );
                });
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
                bool correctAnswer = quizBrain.getQuestionAnswer();

                if(correctAnswer ==  true )
                {

                }
                else
                {

                }
                //The user picked true.
                setState(() {

                  quizBrain.nextQuestion();
                  scoreKeeper.add(
                      Icon(
                        Icons.check,
                        color: Colors.green,
                      )

                  );
                });
              },
            ),
          ),
        ),
        //TODO: Add a Row here as your score keeper
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

