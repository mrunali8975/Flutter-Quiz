import 'package:flutter/material.dart ';
import 'package:adv_basics/answer_button.dart';
import 'package:adv_basics/data/questions.dart';

class Questions extends StatefulWidget {
  const Questions({Key? key,required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  var currentIndex = 0;

  @override
  void answerQuestion(String answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentIndex = currentIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentIndex];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textAlign: TextAlign.center,
              currentQuestion.text,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 40,
            ),
            ...currentQuestion.getShuffledAnswers().map((e) {
              return AnswerButton(e, () {
                answerQuestion(e);
              });
            })

            // AnswerButton('answerText')
            // AnswerButton('answerText')
          ],
        ),
      ),
    );
  }
}
