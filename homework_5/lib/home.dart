import 'package:flutter/material.dart';
import 'apiservices.dart';
import 'triviaJSON.dart';

bool firstTime = true;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Results triviaQuestion;
  int? selectedAnswerIndex;
  bool hasAnswered = false;

  @override
  void initState() {
    super.initState();
    triviaQuestion = Results(
      type: '',
      difficulty: '',
      category: '',
      question: '',
      correctAnswer: '',
      incorrectAnswers: [],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> allAnswers = [];
    if (triviaQuestion.question!.isNotEmpty) {
      allAnswers = [...?triviaQuestion.incorrectAnswers, triviaQuestion.correctAnswer!];
      
      firstTime = false;
    }
    if (firstTime) {
      allAnswers.shuffle();
      firstTime = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gaming Trivia', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (triviaQuestion.question!.isNotEmpty)
              ListTile(
                title: const Text('Q:'),
                subtitle: Text(triviaQuestion.question!),
              ),
            const SizedBox(height: 20),
            if (triviaQuestion.question!.isNotEmpty)
              Column(
                children: allAnswers.asMap().entries.map((entry) {
                  int index = entry.key;
                  String answer = entry.value;
                  return RadioListTile<int>(
                    title: Text(answer),
                    value: index,
                    groupValue: selectedAnswerIndex,
                    onChanged: (value) {
                      setState(() {
                        selectedAnswerIndex = value;
                        hasAnswered = true;
                      });
                    },
                  );
                }).toList(),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
              ),
              child: const Text('Get Question'),
              onPressed: () async {
                if (hasAnswered == false && triviaQuestion.question!.isNotEmpty) {
                  showSnackBar('Please select an answer before getting a new question.');
                  return;
                }
                selectedAnswerIndex = null;
                hasAnswered = false;
                firstTime = true;

                await Apiservices()
                    .requestGeolocation('')
                    .then((TriviaJSON triviaJSON) {
                  manageResponse(triviaJSON);
                }).catchError((error) {
                  showSnackBar('Error: $error');
                });
              },
            ),
            const SizedBox(height: 20),
            if (selectedAnswerIndex != null && triviaQuestion.question!.isNotEmpty)
              Text(
                allAnswers[selectedAnswerIndex!] == triviaQuestion.correctAnswer
                    ? '✅ Correct!'
                    : '❌ Incorrect! Correct Answer: ${triviaQuestion.correctAnswer}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }

  void manageResponse(TriviaJSON triviaJSON) {
    setState(() {
      if (triviaJSON.results != null && triviaJSON.results!.isNotEmpty) {
        triviaQuestion = triviaJSON.results!.first;
      } else {
        triviaQuestion = Results(
          type: '',
          difficulty: '',
          category: '',
          question: '',
          correctAnswer: '',
          incorrectAnswers: [],
        );
        showSnackBar('No trivia question found.');
      }
    });
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}
