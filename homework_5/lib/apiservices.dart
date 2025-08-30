import 'package:http/http.dart' as http;
import 'triviaJSON.dart';
import 'dart:convert';

class Apiservices {
  // Add your API service methods here
  
  Future<TriviaJSON> requestGeolocation(String ipAddress) async {
    String apiUrl = 'https://opentdb.com/api.php?amount=1&category=15&difficulty=easy&type=multiple';
    try {
      return await http
        .get(Uri.parse(apiUrl))
        .then((value) {
          if (value.statusCode == 200) {
            // If the server returns an OK response, parse the JSON
            return processResponse(value.body);
          } else {
            // If the server did not return a 200 OK response, throw an exception
            throw Exception('Failed to load geolocation data');
          } 
        })
        .catchError((error) {
          // Handle any errors that occur during the request
          throw Exception('Failed to request geolocation api');
        });
    } catch (e) {
      // Handle any exceptions that occur during the request
      throw Exception('Failed to get geolocation: $e');
    }    
  }

  TriviaJSON processResponse(String responseBody) {
    return TriviaJSON.fromJson(jsonDecode(responseBody));    
  }
}
