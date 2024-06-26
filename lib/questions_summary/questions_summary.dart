import 'dart:ffi';

import 'package:adv_basics/fonts.dart';
import 'package:adv_basics/questions_summary/question_review.dart';
import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final correctAnswerColor = const Color.fromARGB(255, 1, 255, 77);
  final incorrectAnswerColor = const Color.fromARGB(255, 255, 55, 55);

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            final questionIndexColor =
                (data['user_answer'] == data["correct_answer"])
                    ? correctAnswerColor
                    : incorrectAnswerColor;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: questionIndexColor,
                  child: Text(((data["question_index"] as int) + 1).toString()),
                ),
                const SizedBox(
                  width: 20,
                ),
                QuestionReview(
                  question: data,
                  correctAnswerColor: correctAnswerColor,
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
