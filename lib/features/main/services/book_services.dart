import 'dart:async';

import '../models/book_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class BookServices {
  // Define String genreType = getter;
  Future<List<BookModel>> getAllBooks() async {
    try {
      print("API Started");
      print("action genre search"); //  Get type of search.
      var url =
          "https://www.googleapis.com/books/v1/volumes?q=action"; // Search will be: q=subject:$genreType
      var response = await http
          .get(Uri.parse(url))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException(
            "Connection was not stablished. Please try again after some time.");
      });

      if (response.statusCode == 200) {
        return _parseBookJson(response.body);
      } else {
        print("Null book");
        return _parseBookJson(response.body);
      }
    } on TimeoutException catch (_) {
      print("Response TimeOut");
      rethrow;
    }
  }

  List<BookModel> _parseBookJson(String jsonStr) {
    final jsonMap = convert.json.decode(jsonStr);
    print(jsonMap);
    final jsonList = (jsonMap["items"] as List);
    return jsonMap
        .map((jsonBook) => BookModel(
              title: jsonBook["volumeInfo"]["title"],
              author: jsonBook["volumeInfo"]["authors"][0],
              description: jsonBook["volumeInfo"]["description"],
              thumbnailUrl: jsonBook["volumInfo"]["imageLinks"]
                  ["smallThumbnail"],
            ))
        .toList();
  }
}
