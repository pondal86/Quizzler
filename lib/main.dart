import 'package:flutter/material.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'QuizZap',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.indigo,
        ),
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

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [
    Icon(
      Icons.check_circle,
      color: Colors.blueAccent,
    ),
    Icon(
      Icons.cancel,
      color: Colors.deepOrangeAccent,
    ),
    Icon(
      Icons.cancel,
      color: Colors.deepOrangeAccent,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    int right = 0;
    int wrong = 0;
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
                'This is where the question text will go.',
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
            child: TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.indigo),
              child: Text(
                'True',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                setState(() {
                  scoreKeeper.add(
                    Icon(
                      Icons.check_circle,
                      color: Colors.blueAccent,
                    ),
                  ); //The user picked true.
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent),
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  setState(() {
                    scoreKeeper.add(Icon(
                      Icons.cancel,
                      color: Colors.deepOrangeAccent,
                    )); //The user picked false
                  });
                }),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.check_circle,
                color: Colors.blueAccent,
              ),
              Text(
                '  Right: $right  ',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.blueAccent,
                ),
              ),
              Icon(
                Icons.cancel,
                color: Colors.deepOrangeAccent,
              ),
              Text(
                ' Wrong: $wrong  ',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.deepOrangeAccent,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
