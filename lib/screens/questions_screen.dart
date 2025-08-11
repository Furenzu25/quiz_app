import 'package:flutter/material.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  // Sample quiz data
  final List<Map<String, Object>> questions = [
    {
      'questionText': 'What is Flutter?',
      'answers': [
        'A mobile app development framework',
        'A programming language',
        'A database system',
      ],
      'correctAnswer': 'A mobile app development framework',
    },
    {
      'questionText': 'Which language is used to write Flutter apps?',
      'answers': [
        'Dart',
        'Java',
        'JavaScript',
      ],
      'correctAnswer': 'Dart',
    },
    {
      'questionText': 'What does setState() do in Flutter?',
      'answers': [
        'Triggers a rebuild of the widget',
        'Creates a new widget',
        'Deletes the current widget',
      ],
      'correctAnswer': 'Triggers a rebuild of the widget',
    },
  ];

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];

    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            currentQuestion['questionText'] as String,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              height: 1.3,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ...(currentQuestion['answers'] as List<String>).map((answer) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              child: ElevatedButton(
                onPressed: () => answerQuestion(answer),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 33, 1, 95),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 40,
                  ),
                ),
                child: Text(
                  answer,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
