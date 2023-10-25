import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() {
    return _QuizAppState();
  }
}

class _QuizAppState extends State<QuizApp> {
  final List<String> selectedAnswers = [];
  var activeScreenStr = 'start-screen';

  void switchScreen() {
    setState((){
      activeScreenStr = 'questions-screen';
    });
  }

  void chooseAnswer(String answer){
    print("Chose $answer");

    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState((){
        selectedAnswers.clear();
        activeScreenStr = 'start-screen';
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreenStr == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer
      );
    }

    return MaterialApp(
      title: 'Quizzical',
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.deepPurple.shade900, Colors.deepPurple], 
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
            )
          ),

          // Method 1
          // child: activeScreen, 
          // Method 2
          // child: activeScreenStr == 'start-screen' 
          // ? StartScreen(switchScreen) 
          // : QuestionsScreen(),
          // Method 3
          child: screenWidget
        ),
      )

    );
  }
}
  
