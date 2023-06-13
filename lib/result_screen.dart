import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/question_summary.dart';
import 'package:adv_basics/data/questions.dart';
class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.choosenAnswer});

  final List<String> choosenAnswer;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for(var i=0 ;i<choosenAnswer.length;i++)
      {
        summary.add({
          'question_index':i,
           'question':questions[i].text ,
          'correct_answer':questions[i].answers[0],
          'user_answer':choosenAnswer[i]

        });
      }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summary =getSummaryData();
    final numTotalQuestions=questions.length;
    final numCorrectQuestion=summary.where((element) {
      return element['user_answer']==element['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          // mainAxisSize: MainAxisSize.min,
          children: [
             Text('You answered '
                 '$numTotalQuestions out of $numCorrectQuestion '
                 'question correctly!',
             style: TextStyle(color: Colors.white,fontSize: 22),),
            const SizedBox(
              height: 20,
            ),
             QuestionsSummary(summaryData:getSummaryData(), ),

            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}
