import 'package:flutter/material.dart';
import 'package:pilgan/screens/quiz.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    //final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Quiz App'),
        centerTitle: true,
        backgroundColor: Colors.green,
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
                  "lib/assets/images/minecraft_logo.png",
                  width: 128,
                  height: 128
                ),
            
                const SizedBox(height: 24),
            
                const Text(
                  'Totally vanilla Minecraft quiz!',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
            
                const SizedBox(height: 24),
                
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const QuizScreen()),
                    );
                  },
                  child: const Text('Start Quiz'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}