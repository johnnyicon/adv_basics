import 'package:adv_basics/main.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  StartScreen(this.startQuiz, { super.key, });

  final void Function() startQuiz;

  void onPressed() {
    startQuiz();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png', 
            height: 300,
            color: Color.fromARGB(150, 255, 255, 255)
          ),
          const SizedBox(height: 30),
          const Text(
            'Learn Flutter the fun way!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24
            )
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz, 
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white
            ),
          )
        ],
      ),
    );
  }
}
