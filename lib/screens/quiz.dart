import 'package:flutter/material.dart';
import 'package:pilgan/screens/results.dart';

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  const QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

final List<QuizQuestion> questionsList = [

  QuizQuestion(
    question: 'Vanilla - Which of these tools deal the most base damage (in java edition)?',
    options: [
      'Netherite Shovel',
      'Wooden Axe',
      'Iron Pickaxe',
      'Diamond Sword',
    ],
    correctAnswerIndex: 1,
  ),

  QuizQuestion(
    question: 'Create - How much stress does each Steam Engine hold when the steam engine is running?',
    options: [
      '4.096 SU',
      '8.192 SU',
      '16.384 SU',
      '32.768 SU',
    ],
    correctAnswerIndex: 2,
  ),

  QuizQuestion(
    question: 'Mekanism: Generator - How many Fissile Fuels are required to create a single Antimatter Pellet?',
    options: [
      '100.000 mB',
      '1.000.000 mB',
      '10.000.000 mB',
      '100.000.000 mB',
    ],
    correctAnswerIndex: 2,
  ),

  QuizQuestion(
    question: 'Botania - Which dimension does the elves reside in Botania?',
    options: [
      'Niflheim',
      'Nidavellir',
      'Midgard',
      'Aflheim',
    ],
    correctAnswerIndex: 3,
  ),

  QuizQuestion(
    question: 'Applied Energistic 2 - How many channel does a standard cable hold?',
    options: [
      '4',
      '8',
      '16',
      '32',
    ],
    correctAnswerIndex: 1,
  ),

];

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;
  int score = 0;
  int? selectedAnswerIndex;

  void selectAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index;
    });
  }

  void nextQuestion() {
    if (selectedAnswerIndex == null) return;

    if (selectedAnswerIndex == questionsList[currentQuestionIndex].correctAnswerIndex) {
      score++;
    }

    if (currentQuestionIndex < questionsList.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedAnswerIndex = null;
      });
    } else {
      // To result screen if all question is completed.
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultsScreen(
            score: score,
            totalQuestions: questionsList.length,
            ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final question = questionsList[currentQuestionIndex];

    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Quiz'),
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),

        backgroundColor: Colors.brown,
        body: Padding(
          padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Question ${currentQuestionIndex + 1} '
                  'of ${questionsList.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                    ),
                  ),
              
                  const SizedBox(height: 12),
              
                  LinearProgressIndicator(
                    value: (currentQuestionIndex + 1) / questionsList.length,
                    color: Colors.green,
                  ),
              
                  const SizedBox(height: 28),
              
                  Text(
                    question.question,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              
                  const SizedBox(height: 20),
              
                  // Display choices
                  RadioGroup<int>(
                    groupValue: selectedAnswerIndex,
                    onChanged: (value) {
                      if (value != null) {
                        selectAnswer(value);
                      }
                    },
                    child: SingleChildScrollView(
                      child: Column(
                        children: List.generate(question.options.length, (index) {
                          return Card(
                            color: selectedAnswerIndex == index
                                ? Color.fromARGB(100, 64, 64, 64)
                                : Colors.grey,
                            clipBehavior: Clip.antiAlias,
                            child: ListTile(
                              title: Text(question.options[index]),
                              leading: Radio<int>(value: index),
                              onTap: () => selectAnswer(index),
                            ),
                          );
                        }),
                      ),
                    )
                  ),
              
                  const Spacer(),
              
                  ElevatedButton(
                    onPressed: selectedAnswerIndex == null
                      ? null
                      : nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey
                    ),
                    child: Text(
                      currentQuestionIndex == questionsList.length - 1
                          ? 'Finish Quiz'
                          : 'Next Question',
                      style: TextStyle(color: Colors.black)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
