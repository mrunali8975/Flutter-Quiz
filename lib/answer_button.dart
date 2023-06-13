import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AnswerButton extends StatelessWidget {
  AnswerButton(this.answerText, this.onTab, {super.key});

  final String answerText;
  final void Function() onTab;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          backgroundColor: const Color.fromARGB(255, 33, 1, 95),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {
          onTab();
        },
        child: Text( textAlign: TextAlign.center, answerText,),
    );
  }
}
