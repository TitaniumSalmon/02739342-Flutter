import 'package:flutter/material.dart';
import 'apiservices.dart';
import 'triviaJSON.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Results triviaQuestion;

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
    String ipAddress = '';

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'IP TriviaJSON',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Padding(
            //   padding: const EdgeInsets.all(20.0),
            //   child: const Text(
            //     'Please enter an IP address to get its TriviaJSON:',
            //     style: TextStyle(fontSize: 18, color: Colors.black),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
            //   child: TextField(
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'IP Address',
            //       hintText: 'Enter a valid IP address',
            //     ),
            //     keyboardType: TextInputType.text,
            //     onChanged: (value) {
            //       ipAddress = value; // Capture the input IP address
            //     },
            //   ),
            // ),
            Container(
              
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () async {
                  // Action when button is pressed
                  await Apiservices()
                      .requestGeolocation('')
                      .then((TriviaJSON triviaJSON) {
                        manageResponse(triviaJSON);
                      })
                      .catchError((error) {
                        showSnackBar('Error: $error');
                      });
                },
                child: const Text('Get Question'),
              ),
            ),
            SizedBox(height: 20),
                
            triviaQuestion.question != ''
                ? Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: const Text('Q:'),
                        subtitle: Text('${triviaQuestion.question}'),
                      ),
                      ListTile(
                        title: const Text('A1:'),
                        subtitle: Text('${triviaQuestion.correctAnswer}'),
                      ),
                      ListTile(
                        title: const Text('A2:'),
                        subtitle: Text('${triviaQuestion.incorrectAnswers?[0]}'),
                      ),
                      ListTile(
                        title: const Text('A2:'),
                        subtitle: Text('${triviaQuestion.incorrectAnswers?[1]}'),
                      ),
                      ListTile(
                        title: const Text('A2:'),
                        subtitle: Text('${triviaQuestion.incorrectAnswers?[2]}'),
                      ),
                    ],
                  ),
                )
                : Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: const Text(
                    'No TriviaJSON data available.',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
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
    // if (triviaJSON.status != 'success') {
    //   showSnackBar('Error: ${triviaJSON.message}');
    // }
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }
}
