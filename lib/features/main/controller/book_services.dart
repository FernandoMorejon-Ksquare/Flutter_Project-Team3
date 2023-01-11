import 'dart:async';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'alert_manager.dart';

class BookServices {
  // Define String genreType = getter;

  int maxResults = 11;
  int startIndex = 0;

  Future<Map<String, dynamic>> getAllBooks(context) async {
    Uri url = Uri.https("www.googleapis.com", "/books/v1/volumes", {
      "q": "action",
      "maxResults": "20"
    }); // Search will be: q=subject:$genreType
    Map<String, dynamic> modelObj = {};
    try {
      Response response = await http.get(url);
      modelObj = jsonDecode(response.body);
      if (response.statusCode == 200) {
        AlertManager().displaySnackBar(context, "Books successfully loaded");
      } else {
        AlertManager().displaySnackBar(context, "Something went wrong");
      }
      return modelObj;
    } catch (e) {
      return modelObj;
    }
  }

  loadMore() {
    maxResults += 10;
  }
}