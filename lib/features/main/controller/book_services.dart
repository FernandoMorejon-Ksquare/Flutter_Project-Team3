import 'dart:async';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class BookServices {
  Future<Response> getAllBooks(String search, int index) async {
    Uri url = Uri.https("www.googleapis.com", "/books/v1/volumes", {
      "q": search != "" ? search : "action",
      "maxResults": "20",
      "startIndex": "$index",
    });
    late Response response;
    try {
      response = await http.get(url);
      return response;
    } catch (e) {
      return response;
    }
  }
}
