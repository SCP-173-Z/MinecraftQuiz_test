import 'package:flutter/material.dart';
import 'package:pilgan/screens/home.dart';
import 'package:pilgan/screens/quiz.dart';

class ResultsScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;

  const ResultsScreen({
    super.key,
    required this.score,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double percentage = (totalQuestions == 0) ? 0 : (score / totalQuestions) * 100;
    String scoreMessage = ' ';
    String iconPath = ' ';

    if (percentage == 100) {
      scoreMessage = 'you win';
      iconPath = 'lib/assets/images/Nether_Star.gif';
    }
    else if (percentage >= 50) {
      scoreMessage = 'good job';
      iconPath = 'lib/assets/images/Diamond.png';
    }
    else {
      scoreMessage = 'you died...';
      iconPath = 'lib/assets/images/Barrier.png';
    }

    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quiz Results'),
          backgroundColor: Colors.green,
          centerTitle: true,
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.brown,
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    iconPath,
                    width: 128,
                    height: 128
                  ),
              
                  const SizedBox(height: 24),
              
                  const Text(
                    'Quiz Completed!',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              
                  const SizedBox(height: 10),
              
                  Text(
                    '$score / $totalQuestions',
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
              
                  const SizedBox(height: 8),
              
                  Text(
                    'Score: ${percentage.toStringAsFixed(0)}%',
                    style: const TextStyle(fontSize: 18),
                  ),
              
                  const SizedBox(height: 12),
              
                  Text(
                    scoreMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  
                  const SizedBox(height: 32),
              
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const QuizScreen()), 
                        (route) => false,
                      ),
                      child: const Text('Try Again'),
                    ),
                  ),
              
                  const SizedBox(height: 12),
              
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const HomeScreen()), 
                        (route) => false,
                      ),
                      child: const Text('Back to Home'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}