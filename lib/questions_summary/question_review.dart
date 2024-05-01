import 'package:adv_basics/fonts.dart';
import 'package:flutter/material.dart';

class QuestionReview extends StatelessWidget {
  const QuestionReview(
      {super.key, required this.question, required this.correctAnswerColor});

  final Map<String, Object> question;
  final userAnswerColor = const Color.fromARGB(255, 244, 86, 170);
  final Color correctAnswerColor;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question['question'] as String, style: heading2),
          const SizedBox(
            height: 5,
          ),
          Text(
            question['user_answer'] as String,
            style: TextStyle(color: userAnswerColor),
          ),
          Text(question['correct_answer'] as String,
              style: TextStyle(color: correctAnswerColor)),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
