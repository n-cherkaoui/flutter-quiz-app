import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({
    super.key,
    required this.chosenAnswers,
  });

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        "question_index": i,
        "question": questions[i].text,
        "user_answer": chosenAnswers[i],
        "correct_answer": questions[i].answers[0],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((data) {
      return data["user_answer"] == data["correct_answer"];
    }).length;
    
    /* TODO: 
    1. Change font of questions to match results Page
    2. Change color of all questions and restart quiz to white
    2. Highlight correct answers
    3. Put each number in circles
    4. Add margin between each question
    5. Add an icon to the restart quiz button
    */
    
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('You answered  $numCorrectQuestions out of $numTotalQuestions questions correctly!'),
            const SizedBox(
              height: 30, 
            ),
            QuestionsSummary(summaryData),  
            const SizedBox(
              height: 30,
            ),
            TextButton(onPressed: () {}, child: const Text('Restart Quiz!')),
          ],
        ),
      ),
    );
  }
}
